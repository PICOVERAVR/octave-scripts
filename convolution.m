clear
clf

u = @(t) t > 0;

# t value to test
t = 2.1651;

# range of tau
int_min = -5;
int_max = 5;
samp = 1000000;
tau = linspace(int_min, int_max, samp);
dT = (int_max - int_min) / samp;

# x(t) or x(t - tau)
x_orig = @(t) u(t);
x = @(tau) x_orig(t - tau); # secondary functions allow flipping of x or h easily

# h(t) or h(t - tau)
h_orig = @(t) exp(t) .* u(t - 1);
h = @(tau) h_orig(tau);

lconv = @(tau) x(tau) .* h(tau);
num_ans = trapz(tau, lconv(tau)) # "quad" routines don't handle singularities easily and reliably

hold on
plot(tau, lconv(tau))
plot(tau, x(tau), "--")
plot(tau, h(tau), "--")
# plot(tau, conv(x, h, "same") .* dT); # octave convolution is smoothed, and also takes a while for a ton of samples!
hold off
grid on
legend("x(tau) * h(tau)", "x(tau or t - tau)", "h(tau or t - tau)");
xlabel("tau")
