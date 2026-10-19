% Robust H-infinity analysis of a continuous-time two-vertex system.
% Requires MATLAB, ROLMIP, YALMIP and SeDuMi.
% xdot = A(alpha)*x + B0*w, z = C0*x; D = 0.
% A(alpha) = alpha*A1 + (1-alpha)*A2, 0 <= alpha <= 1.
% A common P gives an upper bound for every fixed alpha,
% not necessarily the exact worst-case norm over the polytope.
yalmip('clear');
A1 = [-1 0.2; 0 -2];
A2 = [-2 0; 0.3 -1];
B0 = [1; 0.5];
C0 = [1 0.4];
A = rolmipvar({A1, A2}, 'A', 2, 1);
B = rolmipvar(B0, 'B');
C = rolmipvar(C0, 'C');

eta = sdpvar(1); % Squared H-infinity bound: eta = gamma^2.
P = rolmipvar(2,2,'P','sym',2,1); % P(a)=a_1*P_1+a_2*P_2
E = rolmipvar(eta, 'eta');
I2 = rolmipvar(eye(2), 'I2');

% Bounded-real LMI, affine in alpha and the decision variables.
BRL = [A'*P + P*A, P*B, C';
       B'*P,       -E,  0;
       C,           0, -1];
LMIs = [P >= 1e-6*I2, BRL <= 0];
options = sdpsettings('solver', 'sedumi', 'verbose', 0);
result = optimize(LMIs, eta, options);
if result.problem == 0 && min(checkset(LMIs)) > -1e-6
    hinf_bound = sqrt(value(eta));
    fprintf('Robust H-infinity upper bound: %.6f\n', hinf_bound);
else
    fprintf('Unfeasible problem\n')
end
