# GLSL functions
1; # avoid turning the file into a function file

# length() is the same as norm() in Octave

function ret = glsl_normalize(v)
  ret = v ./ norm(v);
endfunction

function ret = glsl_fract(f)
  ret = f - floor(f);
endfunction

function ret = glsl_clamp(x, min, max)
  ret = min(max(x, min), max);
endfunction

function ret = glsl_mix(x, y, a)
  ret = x * (1 - a) + y * a;
endfunction

function ret = glsl_step(x, edge)
  ret = x >= edge; # Octave has the opposite behavior of GLSL
endfunction

function ret = glsl_smoothstep(x, edge0, edge1)
  assert(edge0 < edge1, "undefined behavior if edge0 >= edge1");
  ret = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
  ret = t * t * (3.0 - 2.0 * ret);
endfunction

function ret = glsl_reflect(i, n)
  if (length(n) != 1)
    warning("n should be normalized for expected behavior");
  endif
  ret = i - 2.0 * dot(n, i) * n;
endfunction

function ret = glsl_refract(i, n, eta)
  if (length(n) != 1)
    warning("n should be normalized for expected behavior");
  endif
  if (length(i) != 1)
    warning("i should be normalized for expected behavior");
  endif
  k = 1.0 - eta * eta * (1.0 - dot(n, i) * dot(n, i));
  if (k < 0.0)
    ret = 0.0;
  else
    ret = eta * i - (eta * dot(n, i) + sqrt(k)) * n;
  endif
endfunction
