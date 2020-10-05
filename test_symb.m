1; # not a function file

# sympy 1.5.1 needs to be installed from pip for symbolic expressions to work
pkg load symbolic

# for help: help @sym/diff
# helpful functions: simplify, diff(n) for nth derivative, int
# takes the derivative with respect to variable closest to x by default

# define some variables
syms x(t) k M

# first, write the diff eq
diffeq = diff(x, t) == k * (M - x) * x;

# then solve the diff eq with an initial condition
sol = dsolve(diffeq, x(0) == 5.308);

# get the right side of the equation, otherwise we have an equality
sol = rhs(sol);

# finally, substitute the actual values of k and M in
# using these numbers directly in the diff eq results in weird problems.
sol = subs(sol, k, sym(1) / sym(40000));
sol = subs(sol, M, sym(1000));

# simplify if possible
sol = simplify(sol);

# get an example time
eqn = sym(800) == sol;

# solve for t
t_ans = solve(eqn, t);

# find the numeric result
t_ans = double(t_ans)

# to export the function back to a native Octave function:
# f = function_handle(sol);