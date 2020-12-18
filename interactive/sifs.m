function Ck = sifs(x, t, Nk, p)
  
  # sifs (slow interactive fourier series)
  # x: a vector representing a single period of a signal
  # t: time scale corresponding to x
  # Nk: number of exponential terms (optional, defaults to 101)
  # p: plot if true (optional, defaults to false)
  # fourier returns Ck, which is a vector of Nk exponential fourier series cofficients
  
  dT = t(2) - t(1);
  T = dT * length(t)
  w0 = (2 * pi) / T
  
  # this will throw an error if the number of args is less than 2 or 
  # greater than 4
  narginchk(2, 4);
  
  if nargin == 2 # no args provided
    Nk = 101;
    p = false;
  elseif nargin == 3 # Nk provided
    p = false;
  else
    # nothing needs to be done
  end
  
  if Nk > length(x)
    warning("More Fourier Series coefficients than input data points.  Aliasing may occur.")
  endif
  
  # if Nk is 5, k goes from -2 to 2
  min_k = -floor(Nk / 2);
  max_k = floor(Nk / 2);
  k = min_k:max_k;
  
  Ck = zeros(1, length(k));
  for n = 1:length(k)
    Ck(n) = (1 / T) * trapz(t, x .* exp(-1j * k(n) * w0 * t));
  end
  
  if p
    clf
    subplot(3, 1, 1)
    stem(w0 * k, abs(Ck))
    set(gca, 'xtick', [min_k * w0:w0:max_k * w0]);
    xlabel("w0 * k")
    ylabel("|Ck|")
    title("Fourier Series Magnitude Plot")
    grid on
    
    subplot(3, 1, 2)
    stem(w0 * k, angle(Ck))
    set(gca, 'xtick', [min_k * w0:w0:max_k * w0]);
    xlabel("w0 * k")
    ylabel("<Ck (rads)")
    title("Fourier Series Angle Plot")
    grid on
    
    subplot(3, 1, 3)
    hold on
    ext_t = t(1):dT:t(1) + (T * 3) - dT;
    ext_x = [x x x];
    plot(ext_t, ext_x, "--");
    
    fs_x = zeros(1, length(x));
    for n = 1:length(k)
      fs_x = fs_x + Ck(n) * exp(1j * k(n) * w0 * t);
    end
    
    ext_fs_x = [fs_x fs_x fs_x];
    plot(ext_t, ext_fs_x)
    hold off
    xlabel("t")
    ylabel("x(t)")
    title("Fourier Series Approximation")
    grid on
  end
end