close all
clear all
clc


%xlabel('x'),ylabel('y'),zlabel('z');

title('Final Project PUMA 560');
%axis([-15 15 -15 15 -7 15]);
view(-35, 10) %starting point of view (angle)
daspect([3 3 3]) %block resizing
grid on
hold on

L(1)=Link('d', 0, 'a', 0, 'alpha', pi/2);  
L(2)=Link('d', 0, 'a', 0.553, 'alpha', 0); 
L(3)=Link('d', 0.169, 'a', 0.0403, 'alpha', -pi/2);  
L(4)=Link('d', 0.453, 'a', 0, 'alpha', pi/2); 
L(5)=Link('d', 0, 'a', 0, 'alpha', -pi/2);
L(6)=Link('d', 0, 'a', 0, 'alpha', 0);




  
%qf0= [0 0 0 0 ];
%qf1= [0 -pi/3 0 1 ];
%qf2= [-pi/3 -pi/2 pi/2 0 ];
%qf3= [-pi/3 0 pi/2 -2*pi/3 ];
%qf4= [-2*pi/3 0 pi/2 0 ];


robo=SerialLink(L, 'name', 'PUMA560');

%T0 = robo.ikine(qf1);
%T1 = robo.ikine(qf1);

%T2 = robo.fkine(qf2);
%T3 = robo.fkine(qf3);
%T4 = robo.fkine(qf4);







% T = transl(x,y,z);
% q0 = robo.ikine6s(T, 'run');
% robo.plot(q0)

% 
i=1;
for t=0:pi/50:3*pi   % to have one complete round
    r = 0.25;            % radius
    h = 0.5;            % height
    x = r * sin(t);
    y = r * cos(t);
    z = h/(2*pi) * t;
    %T = transl(x,y,z);
    T1(:,:,i) = transl(x,y,z);
    TX(:,i)= x;
    TY(:,i) = y;
    TZ(:,i) = z;
    i=i+1;
    %q0 = robo.ikine6s(T, 'run');
    %robo.plot(q0);

end
plot3(TX,TY,TZ);
i=1;
for t=0:pi/50:3*pi   % to have one complete round
    r = 0.25;            % radius
    h = 0.5;            % height
    x = r * sin(t);
    y = r * cos(t);
    z = h/(2*pi) * t;
    T = transl(x,y,z);
    T1(:,:,i) = transl(x,y,z);
    TX(:,i)= x;
    TY(:,i) = y;
    TZ(:,i) = z;
    i=i+1;
    view(-35+i, 10);
    q0 = robo.ikine6s(T, 'run');
    robo.plot(q0);



end



% 
% t=0:pi/50:5*pi   % to have one complete round
% r = 0.25;            % radius
% h = 0.5;            % height
% x = r * sin(t);
% y = r * cos(t);
% z = h/(2*pi) * t;
% plot3(x,y,z);






% for t=0:pi/50:3*pi  % to have one complete round
% r = 0.25;            % radius
% h = 0.125;            % height
% x = r * sin(t);
% y = r * cos(t);
% z = h/(2*pi) * t;
% 
% T = transl(x,y,z);
% q0 = robo.ikine6s(T, 'run');
% robo.plot(q0)
% x = r * sin(t+pi/50);
% y = r * cos(t+pi/50);
% z = h/(2*pi) * t;
% T = transl(x,y,z);
% q1 = robo.ikine6s(T, 'run');
% q=jtraj(q0, q1, t);  
% robo.plot(q);
% pause(1);
% end



%T = transl(x,y,z);
%q0 = robo.ikine(T);

% robo.plot(q)

% generate q which is a trajectory expressed in joint space.
%% main body


%q=jtraj(qf0, qf0+B, t);  
%robo.plot(q);
%pause(1);
%q=jtraj(qf0+B, qf0+B+B2, t);  
%robo.plot(q);
%pause(1);

%q=jtraj(qf1, qf2, t);  
%robo.plot(q);
%pause(1);

%q=jtraj(qf2, qf3, t);  
%robo.plot(q);
%pause(1);

%q=jtraj(qf3, qf4, t);  
%robo.plot(q);
%pause(1);


close








