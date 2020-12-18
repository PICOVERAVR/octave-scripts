clear
clc

u = @(t) t >= 0;

T = (2 * pi);
func = @(t) 3 + 5 * cos(t) + 6 * sin(2 * t + pi/4);

t = 0:0.01:T;
x = func(t);

Nk = 20;
Ck = sifs(x, t, Nk, true);
for n = 1:length(Ck)
  k = -floor(Nk / 2) + (n - 1);
  printf("C(%d): %f + %fj, or |%f| < %f rads\n", k, real(Ck(n)), imag(Ck(n)), abs(Ck(n)), angle(Ck(n)));
endfor

