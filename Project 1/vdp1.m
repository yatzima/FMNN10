function f = vdp1(t, u)
    mu = 100;
    u1 = u(1);
    u2 = u(2);
    f = [u2 ; (mu * (1 - (u1^2)) * u2) - u1];
end
    
    