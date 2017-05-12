function unew = eulerstep(A, uold, h);
    unew = uold + h.*(A*uold);
end

