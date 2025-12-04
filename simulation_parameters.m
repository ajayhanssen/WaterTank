a1 = 10e-3;
a2 = 10e-3;
rho = 997;

h1_bar = 50;
h2_bar = 50;        
A_t = 50e2; % mm^2

K_pump = 1000; %ml/min/V
u0 = 1/4; % V

%% a1 rechn
A_out = 25;          % mm^2
zeta = 0.05;
g = 9.81;

a1 = A_out/A_t*sqrt(2*g/(1+zeta));
a2 = a1;

%% ss
A = [-a1/(2*sqrt(h1_bar)), 0
     a1/2*sqrt(h1_bar),    -a2/(2*sqrt(h2_bar))];

B = [1/rho*A_t
        0];

C = [0, 1];

D = 0;

sys = ss(A,B,C,D);

%%
step(sys)