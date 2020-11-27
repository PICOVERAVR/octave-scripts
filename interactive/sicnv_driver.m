clear
clf

# x2 gets flipped
x1 = @(t) double(t > 0);
x2 = @(t) cos(t);

# t to test
t = 1.1;
sicnv(x2, x1, t, [-5, 5], 101, true)
