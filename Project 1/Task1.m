%% Task1.3
clear all;
tic;
A = 1:5;
lambda = A;
y0 = 1;
t0 = 0;
tf = 1;

for i = A;
    lambda(i) = randi(20);
end

for i = A;
    errVSh(lambda(i),y0, t0, tf);
end
toc;

%% Task1.4
clear all;
A = [-1 10; 0 -3];
y0 = [1 1]';
t0 = 0;
tf = 10;
errVSh(A, y0, t0, tf);