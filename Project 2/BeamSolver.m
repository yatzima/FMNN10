function BeamSolver
    alpha = 0; beta = 0;
    L = 10; N = 999; E = 1.9e11; q = -50e3;
    equigrid = linspace(0, L, N+2)';
    I = @(x) 1e-3 * (3 - 2.*(cos((pi.*x)/L).^12));
    
    fvec1 = q * ones(N,1);
    M = twopBVP(fvec1, alpha, beta, L, N);
    
    denominator = (E.*I(equigrid));
    fvec2 = M./denominator;
    
    u = twopBVP(fvec2(2 : end-1), alpha, beta, L, N);
    
    figure(1);
    plot(equigrid, u);
    title('Plot of the deflection u');
    xlabel('Position x [m]');
    ylabel('Deflection u [m]');
    display(u(501));
end