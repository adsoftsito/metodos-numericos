clc
clear all

%Introducir valores de la matriz
X=[5 -2; -3 7]
B=[-2; -22]

disp('D= ')
det (X)
xa= X;
xa(:,1)=B;
x1=xa;
x1
disp('D= ')
det (x1)
x1= det (x1)/det (X);

x2= X;
x2(:,2)=B;
det (x2);
x2
disp('D= ')
det (x2)
x2= det (x2)/det (X);

x1
x2
