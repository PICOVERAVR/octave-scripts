clear
clf

xp = -10:1:10;
yp = xp;
func = @(x) sin(x);

slopefield(xp, yp, [-1, 0.5, 1]', func)
