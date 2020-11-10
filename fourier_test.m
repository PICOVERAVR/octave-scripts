clear
clc

u = @(t) t >= 0;

T = 2;
func = @(t) cos(3 * pi * t + pi / 4) + cos(pi * t) + j * sin(pi * t) + 2;

t = 0:0.00001:T;
x = func(t);

Nk = 10;
Ck = fourier(x, t, Nk, true);
for n = 1:length(Ck)
  k = -floor(Nk / 2) + (n - 1);
  printf("C(%d): %f + %fj, or |%f| < %f\n", k, real(Ck(n)), imag(Ck(n)), abs(Ck(n)), angle(Ck(n)));
endfor

# eq = -1 / (T0 * w0 * (1 - k)) * exp(j * w0 * (1 - k) * t - j * 3 * pi / 2) + 1 / (T0 * w0 * (-1 - k)) * exp(j * w0 * (-1 - k) * t + j * 3 * pi / 2);
# eval(subs(subs(eq, t, 4) - subs(eq, t, 3), k, 3))