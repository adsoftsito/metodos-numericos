clc
clear all
%Introducir valores de la matriz
X=[2  3 -1;
   1  1  3;
   1 -4  5]

B=[ 9;
   10;
   -1]

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
x3= X;
x3(:,3)=B;
det (x3);

x3
disp('D= ')
det (x3)
x3= det (x3)/det (X);

x1
x2
x3

