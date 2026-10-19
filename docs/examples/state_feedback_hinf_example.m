% Robust H-infinity state-feedback control of a continuous-time two-vertex system
% Requires MATLAB, ROLMIP, YALMIP, and SeDuMi.
%
% System model:
%   xdot = A(alpha)*x + Bu(alpha)*u + Bw*w
%   z    = C*x + Du*u + Dw*w
%
% Polytope definition:
%   A(alpha)  = alpha*A1  + (1-alpha)*A2,  for 0 <= alpha <= 1.
%   Bu(alpha) = alpha*Bu1 + (1-alpha)*Bu2, for 0 <= alpha <= 1.

yalmip('clear');

% System matrices definition
A1 = [-1.0,  0.2; 
       0.0, -2.0];
       
A2 = [-2.0,  0.0; 
       0.4,  1.0];

Bu1 = [1.0; 
       1.0];
       
Bu2 = [0.5; 
       0.1];

Bw = [0.9; 
          1.0];

C = [1.0, 0.4];
Du = 0;
Dw = 0.2;

% Variable declarations (YALMIP & ROLMIP)
A  = rolmipvar({A1, A2}, 'A', 2, 1);
Bu = rolmipvar({Bu1, Bu2}, 'Bu', 2, 1);

Bw = rolmipvar(Bw, 'Bw');
C  = rolmipvar(C, 'C');
Du = rolmipvar(Du, 'Du');
Dw = rolmipvar(Dw, 'Dw');

% Decision variables
eta = sdpvar(1); % Squared H-infinity bound (gamma^2)
E   = rolmipvar(eta, 'eta');

% Common (parameter-independent) controller variables: W = P^-1, Z = K*W
W = rolmipvar(2, 2, 'W', 'sym', 2, 0); 
Z = rolmipvar(1, 2, 'Z', 'full', 2, 0);  

% LMI construction
BRL_11 = (A * W) + (W * A') + (Bu * Z) + (Z' * Bu');
BRL_12 = (W * C') + (Z' * Du');
BRL_13 = Bw;
BRL_22 = -1;
BRL_23 = Dw;
BRL_33 = -E;

BRL = [BRL_11,  BRL_12,  BRL_13;
       BRL_12', BRL_22,  BRL_23;
       BRL_13', BRL_23', BRL_33];

% Constraints: positivity of W and BRL negative semi-definite
LMIs = [W >= 1e-6 * eye(2), BRL <= 0];

% Optimization and results
options = sdpsettings('solver', 'sedumi', 'verbose', 0);
result = optimize(LMIs, eta, options);

if result.problem == 0 && min(checkset(LMIs)) > -1e-6
    hinf_bound = sqrt(value(eta));
    K = value(Z) / value(W);
    fprintf('Robust H-infinity upper bound: %.6f\n', hinf_bound);
    fprintf('Gain K = [%.4f, %.4f]\n', K(1), K(2));
else
    fprintf('Optimization failed or problem is unfeasible.\n');
end