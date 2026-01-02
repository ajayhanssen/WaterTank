rho = 997;
h_bar = 50e-3; % m  
A_t = 5e-5; % mm^2

K_pump = 1.000; %l/min/V
K_pump = 0.0166666667; % l/s/V
u0 = 1/4; % V

%% load snippets sensor calib
load("ss_data_snippets.mat")

mean17 = mean(ss_17_v2_select.y);
mean15 = mean(ss_15_v2_select.y);
mean14 = mean(ss_14_v2_select.y);

hs = [50e-3, 73e-3, 128e-3];
means_u = [mean14, mean15, mean17];

coeffs = polyfit(means_u, hs, 1);

% k = 0.1254
% d = -0.2682

%% a

u_ins = [1.4, 1.5, 1.7];
m_dot = K_pump * (u_ins-u0)

b = 1/(rho*A_t)
a = b .* m_dot ./ (sqrt(hs))
a = mean(a)

%% plotting
fsize = 24
tiledlayout(1,3)
nexttile
[u_out, v_1, v_2] = load_from_mat("exports_long/ss_1_4_v_long.mat");
t = stepfile.time;
h_2 = v_to_h(v_2);
plot(t, h_2)
grid on
xlabel("$t$ in s", "Interpreter","latex", "FontSize", fsize)
ylabel("$h$ in m", "Interpreter","latex", "FontSize", fsize)
set(gca,'FontSize',fsize)

nexttile
[u_out, v_1, v_2] = load_from_mat("exports_long/ss_1_5_v_long.mat");
t = stepfile.time;
h_2 = v_to_h(v_2);
plot(t, h_2)
grid on
xlabel("$t$ in s", "Interpreter","latex", "FontSize", fsize)
ylabel("$h$ in m", "Interpreter","latex", "FontSize", fsize)
set(gca,'FontSize',fsize)

nexttile
[u_out, v_1, v_2] = load_from_mat("exports_long/ss_1_7_v_long.mat");
t = stepfile.time;
h_2 = v_to_h(v_2);
plot(t, h_2)
grid on
xlabel("$t$ in s", "Interpreter","latex", "FontSize", fsize)
ylabel("$h$ in m", "Interpreter","latex", "FontSize", fsize)
set(gca,'FontSize',fsize)
%%
mdot_bar = a*sqrt(h_bar)*rho*A_t;
u_bar = mdot_bar/K_pump + u0;

A = [-a/(2*sqrt(h_bar))];
B = [1/(rho*A_t)];
C = [1];
D = 0;



sys = ss(A,B,C,D)