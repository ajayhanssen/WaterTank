function [u_out, v_1, v_2] = load_from_mat(path)
    stepfile = load(path);
    stepfile = stepfile.out.ScopeData;
    v_1 = stepfile.signals(1).values;
    v_2 = stepfile.signals(2).values;
    u_out = stepfile.signals(3).values;
end

