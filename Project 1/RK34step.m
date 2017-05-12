function [unew, err] = RK34step(f, uold, told, h)
    
    y1 = f(told, uold);
    y2 = f(told + h/2, uold + (h/2) * y1);
    y3 = f(told + h/2, uold + (h/2) * y2);
    z3 = f(told + h, uold - h * y1 + 2 * h * y2);
    y4 = f(told + h, uold + h * y3);
    
    unew = uold + (h/6)*(y1+2*y2+2*y3+y4);
    err = (h/6)*(2*y2+z3-2*y3-y4);
end