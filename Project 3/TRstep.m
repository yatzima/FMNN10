function unew = TRstep(Tdx, uold, dt)
    I = eye(size(Tdx));
    v = uold + dt*Tdx*uold/2;
    unew = (I - dt*Tdx/2)\v;
end