1; # not a function file

function basic_benchmark()
  printf("Matrix Multiply: %.2f GFLOPS\n", mat_mul(2048));
  printf("Matrix Inverse: %.2f GFLOPS\n", mat_inv(2048));
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