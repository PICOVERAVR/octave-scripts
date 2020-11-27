1; # not a function file

function basic_benchmark()
  machine_info()
  printf("matrix multiply: %.2f gflops\n", mat_mul(2048));
  printf("matrix inverse: %.2f gflops\n", mat_inv(2048));
endfunction

function machine_info()
  ver
  printf("\n");
  printf("fftw information: %s\n", version("-fftw"));
  printf("blas information: %s\n", version("-blas"));
  printf("lapack version: %s\n\n", version("-lapack"));
endfunction

function gflops = mat_mul(N)
  A = single(rand(N, N));
  B = single(rand(N, N));
  start = clock();
  C = A * B;
  eltime = etime(clock(), start);
  
  # 2 floating point execution ports * N^3 operations for a matrix multiply
  gflops = 2 * N * N * N / (eltime * 1e9);
endfunction

function gflops = mat_inv(N)
  A = single(rand(N, N));
  start = clock();
  B = inv(A);
  eltime = etime(clock(), start);
  
  # 2 floating point execution ports * N^3 operations for a matrix inverse
  # using jordan-gauss inversion
  gflops = 2 * N * N * N / (eltime * 1e9);
endfunction

basic_benchmark();