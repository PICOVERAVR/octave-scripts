1; # not a function file

# matrix access is (row, col)
# plot order is (x, y)

# "diary <filename>" to track commands, <filename> is saved in /home/kneil
# pwd, ls, cd all work for moving around

# helpful math functions:
# norm is length of vector
# rref, eig
# roots finds roots of ax^n + bx^(n-1) + ... = 0
# exp(x) is e^x

# function functions:
# fzero finds where a function from the area around a single point or between two points
# fminbnd finds the minimum of a function in a bound
# fplot plots a function in a given range

# helpful display functions:
# fplot plots a function between 0 and 2pi
# hold toggles whether the graph should clear existing data before drawing new data
# figure(1, "position", [1, 1, 1600, 1200]) creates an empty window with window coordinates (1, 1) -> (1600, 1200)
# (include formatting stuff here)
# figure(1, "position", [1, 1, 1600, 1200])

clear;
clc;

