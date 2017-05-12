function errVSh(A, y0, t0, tf)
    N = 1:2^7;
    h = (tf-t0)./N;
    globalErr = N;
    
    for i = N;
        [~, err] = eulerint(A,y0,t0,tf,i);
        globalErr(i) = norm(err);
    end
    
    loglog(h, globalErr);
    hold on;
