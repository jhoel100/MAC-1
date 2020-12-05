%Primera parte
syms k1 k2 k3 t;
A=[-k1,0,0,0;k1,-k2,0,0;0,k2,-k3,0;0,0,k3,0];
A=subs(A,{k1,k2,k3},{0.1,0.05,0.01});
[V,D]=eig(A); %valores propios y vectores propios
x0=[100;0;0;0]; % condiciones iniciales
C=V\x0; %coeficientes
C=C.*exp(diag(D)*t);
x=V*C;
disp('Resultado')
x=simplify(x)
hold on
for i=1: length(x) 
   ezplot(x(i),[0,150]);
end
ylim([0,100])
legend('x_1','x_2','x_3','x_4', 'location','north')
hold off
grid on
xlabel('t')
ylabel('x_1,x_2,x_3,x_4')
title('Serie de desintegración radioactiva A->B->C->D')
x

%Segunda Parte
syms x1(t) x2(t) x3(t) x4(t);
eq1=diff(x1,t)+0.1*x1==0;
eq2=diff(x2,t)-0.1*x1+0.05*x2==0;
eq3=diff(x3,t)-0.05*x2+0.01*x3==0;
eq4=diff(x4,t)-0.01*x3==0;
eqns=[eq1;eq2;eq3;eq4];
S=dsolve(eqns);
S=dsolve(eqns,x1(0)==100,x2(0)==0,x3(0)==0 ,x4(0)==0);
S{1}
S{2}
S{3}
S{4}