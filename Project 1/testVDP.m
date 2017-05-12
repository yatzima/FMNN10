function testVDP
    tic;
    mu = 100;
    [t, y] = ode15s(@vdp1, [0, 2*mu]', [1, 0]'); 
    %[t, y] = adaptiveRK34(@vdp1,[2, 0]', 0, 20*mu, 1e-8);
 
    figure(1);
    plot(t, y(:,2));
    title('The periodic solutions');
    xlabel('Time (t)');
    ylabel('y_2(t)')
    figure(2);
    plot(y(:,1), y(:,2));
    title('The phase portrait');
    xlabel('y_1(t)');
    ylabel('y_2(t)');
    toc;
end