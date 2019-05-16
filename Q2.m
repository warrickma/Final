%% PART B%%
% for n=1
figure(1)
fun1=@(v) 10/(1+v);
fun2=@(v) 10/v-1;
fplot(fun1,'k-');
hold on;
fplot(fun2,'r-');
hold off;
xlim([0 10]);
ylim([0 190]);
% for n=2
figure(2)
fun1=@(v) 10/(1+v^2);
fun2=@(v) (10/v-1)^0.5;
fplot(fun1,'k-');
hold on;
fplot(fun2,'r-');
hold off;
xlim([0 10]);
ylim([0 10]);
%% PART C %%
% when n=1
figure (1);
[v,u]=meshgrid(0:1:10,0:10:190);
dudt=10./(1+v)-u;
dvdt=10./(1+u)-v;
quiver(v,u,dvdt,dudt,0.5);
hold on;
[startv,startu]=meshgrid(0:2:10,0:40:190); 
streamline(v,u,dvdt,dudt,startv,startu);
hold off;
xlim([0,10]);
% when n=2
figure (2);
[v,u]=meshgrid(0:1:10,0:1:10);
dudt=10./(1+v^2)-u;
dvdt=10./(1+u^2)-v;
quiver(v,u,dvdt,dudt,0.5,'r');
hold on;
startv=0:1:10;
startu=0:1:10; 
streamline(v,u,dvdt,dudt,v,u);
hold off;
xlim([0,10]);
ylim([0 10]);
%% Part D Assume a=10 and n=2
syms vs us 
f=10/(1+vs^2)-us;
g=10/(1+us^2)-vs;
dfdvs=diff(f,vs);dfdus=diff(f,us);
dgdvs=diff(g,vs);dgdus=diff(g,us);
J=[dfdvs dfdus;dgdvs dgdus];
%% Part E
% when n =1
syms v
eqn=10/(1+v)==10/v-1;
vs=solve(eqn,v);
us=10/(1+2.7016);
syms vs us
f=10/(1+vs)-us;
g=10/(1+us)-vs;
dfdvs=diff(f,vs);dfdus=diff(f,us);
dgdvs=diff(g,vs);dgdus=diff(g,us);
J=[dfdvs dfdus;dgdvs dgdus];

J =[ -10/(2.7015 + 1)^2,-1;-1, -10/(2.7016 + 1)^2];
e1=eig(J);

% when n=2
syms v
eqn=10/(1+v^2)==(10/v-1)^0.5;
vs=solve(eqn,v);
vs=[0.101 2 9.8990];
us=10./(1+vs.^2);
J1=[ -(20*vs(1))/(vs(1)^2 + 1)^2,-1; -1, -(20*us(1))/(us(1)^2 + 1)^2];
J2=[ -(20*vs(2))/(vs(2)^2 + 1)^2,-1; -1, -(20*us(2))/(us(2)^2 + 1)^2];
J3=[ -(20*vs(3))/(vs(3)^2 + 1)^2,-1; -1, -(20*us(3))/(us(3)^2 + 1)^2];
e1=eig(J1);e2=eig(J2);e3=eig(J3);