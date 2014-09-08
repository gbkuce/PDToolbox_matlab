function dz = rd(t, z)

global G

n = max(G.S); 

F = zeros(G.P, n);
F_mean = zeros(G.P, 1);
x_dot_v = zeros(G.P* n, 1);

% extract matrix of strategies
x_n = vec2mat(z, n);
x = zeros(G.P, n);

for p = 1 : G.P
    x(p, :) = x_n(p, :) * G.m(p);
end


for p = 1 : G.P
    F(p, :) = G.f(x, p);
    F_mean(p) = F(p, :) * x_n(p, :)';

    % calculate update in the strategy
    F_excess = F(p, :) - ones(1, n) * F_mean(p);
    x_dot_v ( (p-1)*n + 1 : p*n ) = F_excess .* x_n(p, :);
end

dz = [x_dot_v];


