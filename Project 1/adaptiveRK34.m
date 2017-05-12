function [t,y] = adaptiveRK34(f, y0, t0, tf, tol)
    h = (abs(tf-t0)*tol^(1/4))/(100*(1+norm(f(t0,y0))));
    n = 1e5;
    %t = zeros(n,1);
    t(n) = 0;
    %y = zeros(n, length(y0));
    y(n, length(y0)) = 0;
    errold = tol;
    
    counter = 1;
    t(counter) = t0;
    y(counter,:) = y0;
    
    y1last = y0(1);
    y2last = y0(2);
    tlast = t0;
    
    while tlast + h < tf
        [unew, err] = RK34step(f, [y1last; y2last], tlast, h);
        
        counter = counter + 1;
        t(counter) = tlast + h;
        y(counter, :) = unew;
        
        y1last = unew(1);
        y2last = unew(2);
        tlast = t(counter);
        
        h = newstep(tol, err, errold, h, 4);
        errold = err;
    end
   
    [unew, ~] = RK34step(f, [y1last; y2last], tlast, tf - tlast);
    t(counter) = tf;
    y(counter, :) = unew;
    
    t = t(1:counter);
    y = y(1:counter, :);
end
    