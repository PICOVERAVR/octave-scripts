function slopefield(xpoints, ypoints, ics, func)
  
  # set up a figure and plot a slope field
  # xpoints, ypoints: where to put arrows
  # func: anonymous function to generate slope field for
  # ics: column vector of initial conditions to plot
  
  figure(1, "position", [1, 1, 1600, 1200]);
  clf(1)
  grid on
  
  [X, Y] = meshgrid(xpoints, ypoints);
  
  # as the dependant variable (x) increases...
  u = ones(size(X));
  
  # ...apply the differential equation.
  v = arrayfun(func, Y, X);
  
  quiver(X, Y, u, v, "linewidth", 0.9, "maxheadsize", 0.2);
  axis tight
  
  hold on
  for n=1:size(ics)
    y = lsode(func, ics(n), xpoints);
    plot(xpoints, y)
  endfor
  hold off
  
endfunction
