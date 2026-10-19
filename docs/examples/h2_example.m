% Robust H-2 analysis of a continuous-time two-vertex system
% Requires MATLAB, ROLMIP, YALMIP, and SeDuMi.
%
% System model:
%   xdot = A(alpha)*x + B0*w
%   z    = C0*x
%   D    = 0 (essential for a finite continuous-time H-2 norm)
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
A  = rolmipvar({A1, A2}, 'A', 2, 1);
C  = rolmipvar(C0, 'C');
I2 = rolmipvar(eye(2), 'I2');

% Parameter-dependent observability Gramian bound: X(alpha) = alpha_1*X_1 + alpha_2*X_2
X = rolmipvar(2, 2, 'P', 'sym', 2, 1);

% Decision variables
eta = sdpvar(1); % Squared H-2 norm bound (gamma^2)
E   = rolmipvar(eta, 'eta');

% LMI construction (trace(B0'*X*B0) bounds the squared H-2 norm)
LMIs = [X >= 1e-6 * I2, (A' * X) + (X * A) + (C' * C) <= 0, E >= trace(B0' * X * B0)];

% Optimization and results
options = sdpsettings('solver', 'sedumi', 'verbose', 0);
result = optimize(LMIs, eta, options);

if result.problem == 0 && min(checkset(LMIs)) > -1e-6
    h2_bound = sqrt(value(eta));
    fprintf('Robust H-2 upper bound: %.6f\n', h2_bound);
else
    fprintf('Optimization failed or problem is unfeasible.\n');
end