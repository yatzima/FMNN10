function unew = eulerstep(Tdx, uold, dt)
    unew = uold + dt*Tdx*uold;
end