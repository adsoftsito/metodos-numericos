clc;
clear all;
% f=@(x)cos(x)-log(x)+exp(x); %Change here for different function

%f=@(x) 2*(x); %Change here for different function
%f=@(x) (1/x);

dof = 9

% f=@(x) (1+((x^2)/dof))^(-1*(dof+1)/2) ; %Change here for different function
%f=@(x) (gamma((dof+1)/2)) / (( (dof * 3.1416) ^ 0.5 )*( gamma(dof/2))); %Change here for different function

 %Change here for different function
f=@(x) ( 1+((x^2)/dof))^(-1*(dof+1)/2) * (gamma((dof+1)/2)) / (( (dof * pi) ^ (1/2) )*( gamma(dof/2))); 

%Change here for different function
%f=@(x) (x * x);
%f=@(x) (1/x)

%f=@(x) (1/x)

a=input('Enter lower limit a: '); % exmple a=1
b=input('Enter upper limit b: ');  % exmple b=2

n=input('Enter the  number of sub-intervals n: '); % exmple n=16
h=(b-a)/n;

if rem(n,2)==1
   fprintf('\n Enter valid n!!!'); 
   n=input('\n Enter n as even number ');
end

for k=1:1:n
  x(k)=a+k*h;
  y(k)=f(x(k));
  fprintf('x = %f \n',y(k));
end
 so=0;se=0;
for k=1:1:n-1
    if rem(k,2)==1
       so=so+y(k);%sum of odd terms
     else
       se=se+y(k); %sum of even terms
    end
end
% Formula:  (h/3)*[(y0+yn)+2*(y3+y5+..odd term)+4*(y2+y4+y6+...even terms)]
answer=h/3*(f(a)+f(b)+4*so+2*se);
fprintf('\n The value of integration is %f',answer); % exmple The value of integration is 0.408009
