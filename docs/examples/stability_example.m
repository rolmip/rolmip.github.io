% Common quadratic Lyapunov stability certificate for dx/dt = A(alpha)*x
% Requires MATLAB, ROLMIP, YALMIP, and SeDuMi.

yalmip('clear');

% Vertex matrices definition
A1 = [-1.0,  0.2; 
       0.0, -2.0];
       
A2 = [-2.0,  0.0; 
       0.3, -1.0];

% Variable declarations (YALMIP & ROLMIP)
% Polytope vertices for A (2 vertices, degree 1)
A = rolmipvar({A1, A2}, 'A', 2, 1);

% Common (parameter-independent) Lyapunov matrix: P (degree 0)
P = rolmipvar(2, 2, 'P', 'sym', 0, 0);

% Identity matrix declared as ROLMIP variable
I = rolmipvar(eye(2), 'I');

% LMI construction
LMIs = [P >= I, (A' * P) + (P * A) <= -I];

% Optimization and results
options = sdpsettings('solver', 'sedumi', 'verbose', 0);
result = optimize(LMIs, [], options);

if result.problem == 0 && min(checkset(LMIs)) > 0
    disp(double(P));
else
    fprintf('Optimization failed or problem is unfeasible.\n');
end