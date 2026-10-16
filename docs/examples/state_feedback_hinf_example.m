% Robust H-infinity state-feedback control of a continuous-time two-vertex system.
% Requires MATLAB, ROLMIP, YALMIP and SeDuMi.
% xdot = A(alpha)*x + Bu(alpha)*u + Bw*w, 
% %  z = C*x+Du*u+Dw*w.
% A(alpha) = alpha*A1 + (1-alpha)*A2, 0 <= alpha <= 1.
% Bu(alpha) = alpha*Bu1 + (1-alpha)*Bu2, 0 <= alpha <= 1.
% A common W gives an upper bound for every fixed alpha,
% not necessarily the exact worst-case norm over the polytope.

A1 = [-1 0.2; 
      0 -2];
A2 = [-2 0; 
      0.4 1];
Bu1 = [1; 1];
Bu2 = [0.5; 0.1];
Bw = [0.9; 1];
C = [1 0.4];
Du = 0;
Dw = 0.2;
A = rolmipvar({A1, A2}, 'A', 2, 1);
Bw = rolmipvar(Bw, 'Bw');
Bu = rolmipvar({Bu1,Bu2}, 'Bu',2,1);
C = rolmipvar(C, 'C');
Du = rolmipvar(Du, 'Du');
Dw = rolmipvar(Dw, 'Dw');

eta = sdpvar; % Squared H-infinity bound: eta = gamma^2.
W = rolmipvar(2,2,'P','sym',2,0); % W(a)=W;
Z = rolmipvar(1,2,'Z','full',2,0);  

% Bounded-real LMI, affine in alpha and the decision variables.
BRL_11 = A*W + W*A'+Bu*Z+Z'*Bu';
BRL_12 = W*C'+Z'*Du';
BRL_13 = Bw;
BRL_22 = -1;
BRL_23 = Dw;
BRL_33 = -eta;

BRL = [BRL_11 BRL_12 BRL_13;
      BRL_12' BRL_22 BRL_23;
      BRL_13' BRL_23' BRL_33];
LMIs = [W >= 1e-6*eye(2), BRL <= 0];
options = sdpsettings('solver', 'sedumi', 'verbose', 0);
result = optimize(LMIs, eta, options);
if result.problem == 0 && min(checkset(LMIs)) > -1e-6
    hinf_bound = sqrt(value(eta));
    K = value(Z)*inv(value(W));
    fprintf('Robust H-infinity upper bound: %.6f Gain K = [%.4f %.4f]\n', hinf_bound,K);
else
    fprintf('Unfeasible problem\n')
end
