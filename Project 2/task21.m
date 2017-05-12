function task21
    function [eigF, eigV] = SturmLiouvilleSolver(N)
        %alpha = 0, beta = 0, L = 1;
        dx = 1/(N+1);
        dx2 = dx^2;
        boundaryVal = zeros(1, N);
        
        a = zeros(N,1);
        a(1) = -2;
        a(2) = 1;
        tdx = toeplitz(a)/dx2;
        
        [eigF, eigV] = eig(tdx);
        eigV = diag(eigV);
        eigF = [boundaryVal; eigF; boundaryVal];
    end
    
    % realEigVal = @(k) -(k*pi).^2;
    % realEigFun = @(x, k) sin(k*pi*x);
    %
    % firstEigVal = realEigVal(1);
    % secondEigVal = realEigVal(2);
    % thirdEigVal = realEigVal(3);
    
    firstEigVal = -(1*pi).^2;
    secondEigVal = -(2*pi).^2;
    thirdEigVal =  -(3*pi).^2;
    
    k = 2:13;
    N = (2.^k)';
    error(length(N), 3) = 0;
    
    for i = 1 : length(N)
        stepSize = N(i);
        [~, lambda] = SturmLiouvilleSolver(stepSize);
        lambda = flipud(lambda);
        error(i, :) = (lambda(1:3))';
    end
    
    error(:, 1) = error(:, 1) - firstEigVal;
    error(:, 2) = error(:, 2) - secondEigVal;
    error(:, 3) = error(:, 3) - thirdEigVal;
    
    figure(1);
    loglog(N, error);
    title('Plot of the numerical error');
    xlabel('Number of gridpoints N');
    ylabel('\lambda_{\Delta x} - \lambda');
    grid on;
    
%     N = 499;
%     [~, eigVal] = SturmLiouvilleSolver(N);
%     eigVal = flipud(eigVal);
%     display(eigVal(1:3));
%     
%     N = 1e3;
%     numberOfModes = 3;
%     x = linspace(0, 1, N);
%     
%     [eigenModes, ~] = SturmLiouvilleSolver(N);
%     
%     figure(1);
%     title('The three lowest eigenmodes');
%     xlabel('');
%     ylabel('');
%     hold on;
%     
%     for i = 0 : (numberOfModes - 1)
%         plot(x, eigenModes(:, end-i));
%     end
end