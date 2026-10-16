% A common quadratic Lyapunov certificate for dx/dt = A(alpha)*x.
% Requires ROLMIP, YALMIP and SeDuMi on the MATLAB path.
yalmip('clear');
A1 = [-1 0.2; 0 -2];
A2 = [-2 0; 0.3 -1];
A = rolmipvar({A1, A2}, 'A', 2, 1);
P = rolmipvar(2, 2, 'P', 0, 0);
I = rolmipvar(eye(2), 'I');

% Uniform margins for this degree-one, two-vertex example.
F = [P >= I, A'*P + P*A <= -I];
options = sdpsettings('solver', 'sedumi', 'verbose', 0);
result = optimize(F, [], options);
assert(result.problem == 0, result.info);
disp(double(P));
