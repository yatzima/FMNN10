function SchrodingerSolver
    display('Choose one of these potentials: ');
    display('Number 1: V(x) = 0');
    display('Number 2: V(x) = 700(0.5 - |x - 0.5|)');
    display('Number 3: V(x) = 800sin^2(pi*x)');
    display('Number 4: V(x) = 800sin^2(2*pi*x)')
    alternativePotential = input('Enter a number: ');
    tic;
    switch alternativePotential
        case 1
            potential = @(x) (x.*0)';
        case 2
            potential = @(x) 700.*(0.5 - abs(x - 0.5))';
        case 3
            potential = @(x) 800.*(sin(pi.*x).^2)';
        case 4
            potential = @(x) 800.*(sin(2.*pi.*x).^2)';
        otherwise
            display('The alternative does not exist.')
            return
    end
    
    function [waveFunc, probDens, eigVal] = SchrodSolver(pot, N)
        dx = 1/(N+1); dx2 = dx^2; boundaryVal(1, N) = 0;
        
        a(N, 1) = 0; a(1) = -2; a(2) = 1;
        tdx = (toeplitz(a)/dx2) - diag(pot);
        
        [waveFunc, eigVal] = eig(tdx);
        eigVal = diag(abs(eigVal));
        waveFunc = normc(waveFunc);
        waveFunc = [boundaryVal; waveFunc; boundaryVal];
        probDens = (abs(waveFunc)).^2;
    end
    
    N = 999; numberOfEigF = 8;
    equigrid = linspace(0, 1, N+2)';
    interior = equigrid(2:end-1);
    
    [waveFun, probDens, lambda] = SchrodSolver(potential(interior), N);
    
    figure(1);
    title('Wave Functions');
    xlabel('x in the interval [0, 1]');
    ylabel('\psi_k +\lambda_k');
    hold on;
    for i = 0 : numberOfEigF - 1
        plot(equigrid, 5e2*waveFun(:, end-i) + lambda(end-i));
    end
    
    figure(2);
    title('Probability Density');
    xlabel('x in the interval [0, 1]');
    ylabel('|\psi_k|^2 +\lambda_k');
    hold on;
    for i = 0 : numberOfEigF - 1
        plot(equigrid, 1.25e4*probDens(:, end-i) + lambda(end-i));
    end
    toc;
end