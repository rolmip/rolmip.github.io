% Definition of a homogeneous matrix polynomial on the unit simplex
% Requires MATLAB, ROLMIP, and YALMIP.
%
% Polynomial model:
%   A(alpha) = alpha_1*A1 + alpha_2*A2 + alpha_3*A3
%   where alpha_i >= 0 and sum(alpha_i) = 1.

% Vertex matrices definition
A1 = [1, 0; 
      0, 2];
      
A2 = [2, 1; 
      1, 3];
      
A3 = [3, 0; 
      0, 1];

% Matrix polynomial declaration (3 vertices, degree 1)
A = rolmipvar([A1, A2, A3], 'A', 3, 1);

% Retrieve and display the coefficient of alpha_2 (exponent vector [0, 1, 0])
coefficient = A([0, 1, 0]);
disp(coefficient{1});