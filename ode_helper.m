1; # not a function file

# set up a figure and plot a slope field
# xpoints, ypoints indicate where to put arrows (don't need to be the same!)
# func has to be something like @(y, x)[ -x * y ];
function slopefield(xpoints, ypoints, func)
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
endfunction

# plot a diff eq with various initial conditions
# xpoints and func are the same as above, and ics is a column vector of initial conditions to plot
function plotics(xpoints, ics, func)
  hold on
  for n=1:size(ics)
    y = lsode(func, ics(n), xpoints);
    plot(xpoints, y)
  endfor
  hold off
endfunction
