function sift(f, tlim, Nt, p)
  
  # sift (slow interactive fourier transform)
  # f: an anonymous function to take the Fourier Transform of
  # tlim: a two-element vector representing the time range of the function
  # Nt: number of time samples to take
  # p: plot if true
  
  t = linspace(tlim(1), tlim(2), Nt);
  dT = t(2) - t(1);
  
  w = linspace(-pi/dT, pi/dT, length(t)); % get range of w
  F_w = zeros(1, length(w));
  for wi = 1:length(w)
    F_w(wi) = trapz(t, f(t) .* exp(-1j * w(wi) * t));
  end
  
  if p
    subplot(2, 1, 1)
    plot(w, abs(F_w))
    xlabel("w")
    ylabel("|F(w)|")
    title("Magnitude of F(w)")
    grid on

    subplot(2, 1, 2)
    stem(w, angle(F_w))
    xlabel("w")
    ylabel("<F(w) (rad)")
    title("Phase of F(w)")
    grid on
  endif

endfunction

function siift(F, wlim, Nw)
  x_r = zeros(1, length(t));
  for ti = 1:length(t)
    x_r(ti) = 1 / (2 * pi) * trapz(w, X .* exp(1j * w * t(ti)));
  end
endfunction
