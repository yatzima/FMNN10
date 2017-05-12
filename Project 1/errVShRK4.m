function errVShRK4(f, y0, t0, tf)
    N = 1:2^9;
    h = (tf-t0)./N;
    globalErr = N;
    
    for i = N;
        [~, err] = RK4int(f,y0,t0,tf,i);
        globalErr(i) = norm(err);
    end
    figure(1)
    loglog(h, globalErr);
    title('Global error as a function of stepsize h')
    xlabel('Stepsize h')
    ylabel('Global error')
    axis([1e-3 1e0 1e-8 1e0])
    grid on
    hold on;
end