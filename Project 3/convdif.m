function unew = convdif(u, a, d, dt)
    N = length(u);
    M = 1/dt;
    dx = 1/N;
    dx2 = dx^2;
    
    b = d/dx2 + a/(2*dx);
    c = - 2*d/dx2;
    e = d/dx2 - a/(2*dx);
    A = diag(b*ones(N-1,1),-1) + diag(c*ones(N,1) ,0) + diag(e*ones(N-1,1) ,1);
    A(1,N) = e;
    A(N,1) = b;
    unew = TRstep(A, u, dt);
end