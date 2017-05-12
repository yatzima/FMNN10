function f = lotka(t, u)
    a = 3;
    b = 9;
    c = 15;
    d = 15;
    u1 = u(1);
    u2 = u(2);
    f = [a * u1 - b * u1 * u2; c * u1 * u2 - d * u2];
end