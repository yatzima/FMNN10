function [eigF, eigV] = SturmSolver(N)
    dx = 1/(N+1); 
    dx2 = dx^2;
    boundaryVal(1, N) = 0;
    
    a = zeros(N,1);
    a(1) = -2;
    a(2) = 1;
    tdx = toeplitz(a)/dx2;
    
    [eigF, lambda] = eig(tdx);
    eigV = diag(lambda);
    eigF = [boundaryVal; eigF; boundaryVal];
end