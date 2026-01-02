RGB = orderedcolors("glow");

%% plot 1: single trajectory with pid
fsize = 16;
load("exports_WT_2\traj_mit_PID_v3.mat")
treal = out.tout;
h2Real = out.ScopeData.signals(2).values;
hrefReal = out.ScopeData.signals(3).values;

idx = treal>=100;
treal = treal-100;

fig = figure;
fig.Position = [100, 100, 1200, 400];
tiledlayout(1,2)

nexttile
plot(treal(idx), h2Real(idx))
hold on
plot(treal(idx), hrefReal(idx), 'LineWidth', 3, 'Color', RGB(7,:))
grid on
xlabel("$t$ in s", "Interpreter","latex", "FontSize", fsize)
ylabel("$h$ in m", "Interpreter","latex", "FontSize", fsize)
set(gca,'FontSize',fsize)
ylim([0.04 0.085])
xlim([0 160])
legend({"$h$", "$h_\mathrm{ref}$"}, 'Interpreter', 'latex', 'location', 'southeast')
hold off


nexttile
load("simulation_mats\traj_single_sim.mat")
tSim = data{2}.Values.Time;
h2Sim = data{2}.Values.Data;
hrefSim = data{1}.Values.Data;

plot(tSim, h2Sim)
hold on
plot(tSim, hrefSim, 'LineWidth', 3, 'Color', RGB(2,:))
grid on
xlabel("$t$ in s", "Interpreter","latex", "FontSize", fsize)
ylabel("$h$ in m", "Interpreter","latex", "FontSize", fsize)
set(gca,'FontSize',fsize)
ylim([0.04 0.085])
xlim([0 160])
legend({"$h$", "$h_\mathrm{ref}$"}, 'Interpreter', 'latex', 'location', 'southeast')
hold off

%% plot2: double trajectory with pid

fsize = 16;
load("exports_WT_2\traj_doppelt_mit_PID_v3.mat")
treal = out.tout;
h2Real = out.ScopeData.signals(2).values;
hrefReal = out.ScopeData.signals(3).values;

idx = treal>=200 & treal <= 750;
treal = treal-200;

fig = figure;
fig.Position = [100, 100, 1200, 400];
tiledlayout(1,2)

nexttile
plot(treal(idx), h2Real(idx))
hold on
plot(treal(idx), hrefReal(idx), 'LineWidth', 3, 'Color', RGB(7,:))
grid on
xlabel("$t$ in s", "Interpreter","latex", "FontSize", fsize)
ylabel("$h$ in m", "Interpreter","latex", "FontSize", fsize)
set(gca,'FontSize',fsize)
ylim([0.04 0.095])
xlim([0 550])
legend({"$h$", "$h_\mathrm{ref}$"}, 'Interpreter', 'latex', ...
    'location', 'northeast')
hold off


nexttile
load("simulation_mats\traj_double_sim.mat")
tSim = data{2}.Values.Time;
h2Sim = data{2}.Values.Data;
hrefSim = data{1}.Values.Data;

idx = tSim >= 200 & tSim < 750;
tSim = tSim-200;

plot(tSim, h2Sim)
hold on
plot(tSim, hrefSim, 'LineWidth', 3, 'Color', RGB(2,:))
grid on
xlabel("$t$ in s", "Interpreter","latex", "FontSize", fsize)
ylabel("$h$ in m", "Interpreter","latex", "FontSize", fsize)
set(gca,'FontSize',fsize)
ylim([0.04 0.095])
xlim([0 550])
legend({"$h$", "$h_\mathrm{ref}$"}, 'Interpreter', 'latex', ...
    'location', 'northeast')
hold off