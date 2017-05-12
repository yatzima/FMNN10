function unew = LaxWen(u, amu)
    sub = (amu/2)*(1+amu);
    main = 1 - amu^2;
    sup = -(amu/2)*(1-amu);
    
    N = length(u);
    
    circ = diag(sub*ones(N-1,1),-1) + diag(main*ones(N,1) ,0) + diag(sup*ones(N-1,1) ,1);
    circ(N,1) = sup;
    circ(1,N) = sub;
    
    unew = circ * u;
end