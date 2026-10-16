% Robust H-2 analysis of a continuous-time two-vertex system.
% Requires MATLAB, ROLMIP, YALMIP and SeDuMi.
% xdot = A(alpha)*x + B0*w, z = C0*x; D = 0.
% A(alpha) = alpha*A1 + (1-alpha)*A2, 0 <= alpha <= 1.
% D = 0 is essential for a finite continuous-time H-2 norm.
% A common observability-Gramian bound X gives an upper bound
% for every fixed alpha, not necessarily the exact worst case.
yalmip('clear');
A1 = [-1 0.2; 0 -2];
A2 = [-2 0; 0.3 -1];
B0 = [1; 0.5];
C0 = [1 0.4];
A = rolmipvar({A1, A2}, 'A', 2, 1);
C = rolmipvar(C0, 'C');
tol=1e-6;

X = rolmipvar(2,2,'P','sym',2,1); % X(a)=a_1*X_1+a_2*X_2
eta=sdpvar;
etar=rolmipvar(eta,'eta');
I2 = rolmipvar(eye(2), 'I2');
% trace(B0'*X*B0) bounds the SQUARED H-2 norm.
LMIs = [X >= tol*I2, A'*X + X*A + C'*C <= 0, etar >= trace(B0'*X*B0)];

options = sdpsettings('solver', 'sedumi', 'verbose', 0);
result = optimize(LMIs, eta, options);
if result.problem == 0 && min(checkset(LMIs)) > -tol
    h2_bound = sqrt(value(eta));
    fprintf('Robust H-2 upper bound: %.6f\n', h2_bound);
else
    fprintf('Unfeasible problem\n')
end

