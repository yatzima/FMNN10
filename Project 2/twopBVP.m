function y = twopBVP(fvec, alpha, beta, L, N)
    %Input fvec contains the interiorpoints. 
    dx = L/(N+1); dx2 = dx^2;
    yfirst = alpha/dx2;
    ylast = beta/dx2;
    
    fvec(1) = fvec(1) - yfirst;
    fvec(end) = fvec(end) -ylast;
    
    %To create the tridiagonal matrix
    a = zeros(N,1); a(1) = -2; a(2) = 1;
    tdx = toeplitz(a)/dx2;
    
    %Output y contains the appended boundary values.
    y = tdx\fvec;
    y = [alpha; y; beta];
end