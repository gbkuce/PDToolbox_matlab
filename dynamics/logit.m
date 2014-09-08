function dz = logit(t,z)

global G

eta = G.eta;

% extract matrix of strategies
n = max(G.S);
x_n = vec2mat(z,n);
x = zeros(G.P, n);

for p = 1 : G.P
    x(p, :) = x_n(p, :) * G.m(p);
end

% calculate fitness of each strategy
F = zeros(G.P, n);
F_ = zeros(G.P, n);
F_mean = zeros(G.P, 1);
x_dot_v = zeros(G.P* n, 1);


for p = 1 : G.P
    F(p, :) = G.f(x, p);
    F_(p, :) = exp( F(p, 1:G.S(p) ) / eta );
    F_mean(p) = sum(F_(p,:));


% calculate update in the strategy
    x_dot_v( (p-1)*n + 1 : p*n) = F_(p, :) / F_mean(p) - x_n(p, :);

end

dz = [x_dot_v];


