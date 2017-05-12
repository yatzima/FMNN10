function f = constant(x, y)
    a = 3;
    b = 9;
    c = 15;
    d = 15;
    
    h = @(x,y) c.*x + b.*y - d.*log(x) - a.*log(y);
    f = abs((h(x,y)./h(x(1), y(1))) - 1);
end