% Robust H-infinity analysis of a continuous-time two-vertex system
% Requires MATLAB, ROLMIP, YALMIP, and SeDuMi.
%
% System model:
%   xdot = A(alpha)*x + B0*w
%   z    = C0*x
%   D    = 0
%
% Polytope definition:
%   A(alpha) = alpha*A1 + (1-alpha)*A2, for 0 <= alpha <= 1.

yalmip('clear');

% System matrices definition
A1 = [-1.0,  0.2; 
       0.0, -2.0];
       
A2 = [-2.0,  0.0; 
       0.3, -1.0];
       
B0 = [1.0; 
      0.5];
      
C0 = [1.0, 0.4];

% Variable declarations (YALMIP & ROLMIP)
A = rolmipvar({A1, A2}, 'A', 2, 1);
B  = rolmipvar(B0, 'B');
C  = rolmipvar(C0, 'C');
I2 = rolmipvar(eye(2), 'I2');

% Decision variables
eta = sdpvar(1); % Squared H-infinity bound (gamma^2)
E   = rolmipvar(eta, 'eta');

% Parameter-dependent Lyapunov matrix: P(alpha) = alpha_1*P_1 + alpha_2*P_2
% A common P gives an upper bound for every fixed alpha,
% not necessarily the exact worst-case norm over the polytope.
P = rolmipvar(2, 2, 'P', 'sym', 2, 1); 

% Bounded-real LMI, affine in alpha and the decision variables.
BRL_11 = (A' * P) + (P * A);
BRL_12 = P * B;
BRL_13 = C';
BRL_22 = -E;
BRL_23 = 0;
BRL_33 = -1;

BRL = [BRL_11,  BRL_12,  BRL_13;
       BRL_12', BRL_22,  BRL_23;
       BRL_13', BRL_23', BRL_33];

LMIs = [P >= 1e-6 * I2, BRL <= 0];

% Optimization and results
options = sdpsettings('solver', 'sedumi', 'verbose', 0);
result = optimize(LMIs, eta, options);

if result.problem == 0 && min(checkset(LMIs)) > -1e-6
    hinf_bound = sqrt(value(eta));
    fprintf('Robust H-infinity upper bound: %.6f\n', hinf_bound);
else
    fprintf('Optimization failed or problem is unfeasible.\n');
end