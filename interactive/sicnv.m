function num_ans = sicnv(x1, x2, t, tau_lim, Ns, p)
  
  # sicnv (slow interactive convolution)
  # x1, x2: anonymous functions to convolve (x2 is flipped)
  # t: t value to test
  # tau_lim: a two-element vector representing the minimum and maximum range of the convolution
  # Ns: number of samples to use
  # p: plot if true
    
  narginchk(4, 6);
  
  if nargin == 4 # no args provided
    Ns = 101;
    p = false;
  elseif nargin == 5 # Ns provided
    p = false;
  else
    # nothing needs to be done
  end
  
  # range of tau
  tau = linspace(tau_lim(1), tau_lim(2), Ns);
  dT = (tau_lim(2) - tau_lim(1)) / Ns;

  x2_f = @(tau, t) x2(t - tau);
  lconv = @(tau, t) x1(tau) .* x2_f(tau, t);
  num_ans = trapz(tau, lconv(tau, t)); # "quad" routines don't handle singularities easily and reliably

  if p
    hold on
    plot(tau, lconv(tau, t))
    plot(tau, x1(tau), "--")
    plot(tau, x2(tau), "--")
    # plot(tau, conv(x, h, "same") .* dT); # octave convolution is smoothed, and also takes a while for a ton of samples!
    hold off
    grid on
    legend("x1(tau) * x2(t - tau)", "x1(tau)", "x2(tau)");
    xlabel("tau")
  endif
    
endfunction
