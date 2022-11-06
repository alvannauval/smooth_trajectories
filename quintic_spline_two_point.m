%% PARAMETER INITIALIZATION
clear all
clc

y  = [0 5 10];    % Init and final position
vy = [0 1 0];     % Init and final velocity
T  = [0 3];     % Init and final time


%% SOLVER a0 a1 a2 a3 b0 b1 b2 b3
syms a0 a1 a2 a3 b0 b1 b2 b3 

eqn1 = a0 == y(1);
eqn2 = a0 + 2*a1 + 4*a2 + 8*a3 == y(2);
eqn3 = b0 == y(2);
eqn4 = b0 + 2*b1 + 4*b2 + 8*b3 == y(3);
eqn5 = a1 == vy(1);
eqn6 = b1 == vy(2);
eqn7 = 3*b3() + 2*b2() == vy(3) - vy(2);
eqn8 = a1 + 4*a2 + 12*a3 == vy(2);
% eqn9 = a2 - b2 + 6*a3 == 0;
% eqn10 = a2 == 0;
% eqn11 = b2 + 6*a3 == 0;



equations = [eqn1;eqn2;eqn3;eqn4;eqn5;eqn6;eqn7;eqn8];
disp('Original Equations')
disp(equations)

sol = solve([eqn1 eqn2 eqn3 eqn4 eqn5 eqn6 eqn7 eqn8], ...,
    [a0 a1 a2 a3 b0 b1 b2 b3 ]);
a0 = sol.a0;
a1 = sol.a1;
a2 = sol.a2;
a3 = sol.a3;
b0 = sol.b0;
b1 = sol.b1;
b2 = sol.b2;
b3 = sol.b3;

solutions = [a0;a1;a2;a3;b0;b1;b2;b3];
disp('Solutions')
disp(solutions)


%% SYSTEM AND GRAPH
syms y1(t) y2(t) t
 
y1(t)   = a3*(t-y(1))^3 + a2*(t-y(1))^2 + a1*(t-y(1)) + a0;
y2(t)   = b3*(t-y(2))^3 + b2*(t-y(2))^2 + b1*(t-y(2)) + b0;

ys=[y1(t);y2(t)];
disp('Solved Equations')
disp(ys)

t1 = linspace(y(1),y(2),10);
t2 = linspace(y(2),y(3),10);


figure(1)
subplot(3,1,1)
plot(y1(t1), 'r')
plot(y2(t2), 'k')
title('y displacement')
% 
% subplot(3,1,2)
% title('y velocity')

% subplot(5,1,3)
% fplot(y_2(t),[T(1) T(2)])
% title('y acceleration')
% 
% subplot(5,1,4)
% fplot(y_3(t),[T(1) T(2)])
% title('y jerk')
% 
% subplot(5,1,5)
% fplot(y_4(t),[T(1) T(2)])
% title('y jounce')







