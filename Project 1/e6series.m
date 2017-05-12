function e6series
    tic;
    %mu = 10000;
    mu = [10, 15, 22, 33, 47, 68, 100, 150, 220, 330, 470, 680, 1000, 10000, 100000];
    %n1(length(mu)) = 0;
    n2(length(mu)) = 0;
    
    for i = 1:length(mu);
        mi = mu(i);
        f = @(t, u) [u(2) ; (mi * (1 - (u(1)^2)) * u(2)) - u(1)];
        %[t1, ~] = adaptiveRK34(f,[2, 0]', 0, 0.7*mi, 1e-8);
        [t2, ~] = ode15s(f, [0, 0.7*mu(i)]', [2, 0]');
        %n1(i) = length(t1); 
        n2(i) = length(t2);
    end
    
    %figure(1);
    %loglog(mu, n1);
    %title('adaptiveRK34');
    %xlabel('Number of steps N');
    %ylabel('The stiffness parameter \mu');
    %grid on;
    
    figure(2);
    loglog(mu, n2);
    title('ode15s');
    xlabel('The stiffness parameter \mu');
    ylabel('Number of steps N');
    grid on;
    toc;
end
