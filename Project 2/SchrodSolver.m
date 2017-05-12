function [waveFun, probDens, eigV] = SchrodSolver(pot, N)
    % alpha = 0, beta = 0, L = 1
    dx = 1/(N+1);
    dx2 = dx^2;
    
    a = zeros(N,1);
    a(1) = -2;
    a(2) = 1;
    %tdx = toeplitz(a)/dx2;
    tdx = (toeplitz(a)/dx2) - diag(pot);
    
    [waveFun, lambda] = eig(tdx);
    
    eigV = abs(diag(lambda));
%     eigV = eigV - flipud(pot);
%     size(waveFun)
%     size(pot)
%     for i = 0 : N - 1
%         waveFun(:, end-i) = waveFun(:, end - i) - pot;
%     end
    waveFun = normc(waveFun);
    
    probDens = abs(waveFun).^2;
end