% A homogeneous matrix polynomial on the unit simplex.
% Requires ROLMIP and YALMIP on the MATLAB path.
A1 = [1 0; 0 2];
A2 = [2 1; 1 3];
A3 = [3 0; 0 1];

% A(alpha) = alpha(1)*A1 + alpha(2)*A2 + alpha(3)*A3
% alpha(i) >= 0, sum(alpha) = 1.
A = rolmipvar([A1 A2 A3], 'A', 3, 1);

% Retrieve the coefficient of alpha(2).
coefficient = A([0 1 0]);
disp(coefficient{1});
