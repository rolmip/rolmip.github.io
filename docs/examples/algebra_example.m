% Matrix polynomial algebra on a two-vertex simplex
% Requires MATLAB, ROLMIP, and YALMIP.

% Vertex matrices definition
A1 = [1, 0; 
      0, 2];
      
A2 = [2, 1; 
      1, 3];

B1 = [0,  1; 
      1,  0];
      
B2 = [1,  0; 
      0, -1];

% Matrix polynomial declarations (2 vertices, degree 1)
A = rolmipvar({A1, A2}, 'A', 2, 1);
B = rolmipvar({B1, B2}, 'B', 2, 1);

% Matrix multiplication preserves the order of the factors.
C = A * B;
S = A + B;

% Retrieve and display the coefficient of alpha_1*alpha_2 (degree-two product)
coefficient = C([1, 1]);
disp(coefficient{1});