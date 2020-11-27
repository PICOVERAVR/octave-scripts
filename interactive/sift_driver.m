clear
clc

u = @(t) t >= 0;

T = 2;
func = @(t) cos(3 * pi * t + pi / 4) + cos(pi * t) + j * sin(pi * t) + 2;

t = 0:0.01:T;
x = func(t);

Nk = 10;
Ck = sift(x, t, Nk, true);
for n = 1:length(Ck)
  k = -floor(Nk / 2) + (n - 1);
  printf("C(%d): %f + %fj, or |%f| < %f rads\n", k, real(Ck(n)), imag(Ck(n)), abs(Ck(n)), angle(Ck(n)));
endfor

