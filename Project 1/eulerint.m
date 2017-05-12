function [approx, err] = eulerint(A, y0, t0, tf, N)
    uold = y0;
    for i=1:N
        approx = eulerstep(A, uold, ((tf-t0)./N));
        uold = approx;
    end
    approx = uold;
    err = expm((tf-t0)*A)*y0 - approx;
end

