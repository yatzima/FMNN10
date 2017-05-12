function hnew = newstep(tol, err, errold, hold, k)
    hnew = (tol/norm(err))^(2/(3*k)) * (tol/norm(errold))^((-1)/(3*k)) * hold;
end
