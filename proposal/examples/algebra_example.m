% Matrix polynomial algebra on a two-vertex simplex.
% Requires ROLMIP and YALMIP on the MATLAB path.
A = rolmipvar({[1 0; 0 2], [2 1; 1 3]}, 'A', 2, 1);
B = rolmipvar({[0 1; 1 0], [1 0; 0 -1]}, 'B', 2, 1);

% Matrix multiplication preserves the order of the factors.
C = A*B;
S = A + B;

% Coefficient of alpha(1)*alpha(2) in the degree-two product.
coefficient = C([1 1]);
disp(coefficient{1});
