clear all
close all

%% load data

% step 1.7 volt
stepfile = load("exports_long/ss_1_4_v_long.mat");
stepfile = stepfile.out.ScopeData;
v_1 = stepfile.signals(1).values;
v_2 = stepfile.signals(2).values;
u_out = stepfile.signals(3).values;

t = stepfile.time;

ts = t(13)-t(12);

%%
plot(t, v_2);
hold on
plot(t, v_1);
grid on

%% load snippets sensor calib
load("ss_data_snippets.mat")

mean17 = mean(ss_17_v2_select.y);
mean15 = mean(ss_15_v2_select.y);
mean14 = mean(ss_14_v2_select.y);

hs = [50, 73, 128];
means = [mean14, mean15, mean17];

coeffs = polyfit(means, hs, 1)

% k = 125.3723
% d = -268.1794

%% a2
a1 = sqrt(2*g)

u_ins = [1.4, 1.5, 1.7];
m_dot = K_pump * (u_ins-u0)

b = 1/(rho*A_t)
a2 = b .* m_dot ./ (sqrt(hs))
a2 = mean(a2)