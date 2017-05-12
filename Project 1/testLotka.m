function testLotka
    tic;
    iv = [1, 1]';
    %[t, y] = ode45(@lotka, [0, 100]', iv);
    [t, y] = adaptiveRK34(@lotka, iv, 0, 100, 1e-8);
    
    figure(1);
    %plot(a, b);
    plot(t,y);
    title('The periodic solutions');
    xlabel('Time (t)');
    ylabel('y(t)');
    
    figure(2);
    plot(y(:, 1), y(:, 2));
    %plot(b(:,1), b(:,2));
    title('The phase portrait');
    xlabel('y_1(t)');
    ylabel('y_2(t)');
    
    figure(3);
    semilogy(t, constant(y(:, 1), y(:, 2)));
    title('Constant');
    xlabel('Time (t)');
    ylabel('H');
    toc;
end