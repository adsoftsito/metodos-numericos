clear;
clc;
while true %Este ciclo nos permite validar que el primer coeficiente sea 1
 fx = input('Ingrese la matriz de coeficientes de la función fx: ');
 if fx(1)==1
 break
 else
 disp('ERROR!!!!!')
 disp('El primer coeficiente debe ser igual a 1, por favor intente de nuevo.')
 end
end
format long;%Usaremos la mayor cantidad de dígitos posibles.
Tol=0.0001;
r = -1;
s = -1;
n= length(fx);%Tamaño de la función
it=0;
Maxit=800;%Ponemos un máximo de iteraciónes en caso de que no converger
Roots = sparse(1,n-1);%Creamos la matriz que nos almacenará las raices
cRoot=0;%Contador de la matriz
Er=100;%Para iniciar los errores los colocaremos en un 100%
Es=100;
while true
 it=it+1;%Se incrementa en 1 la iteración
 if (n-1>=3)
 bn=fx(1);
 Mbi(1)=bn;%Mbi es una matriz que almacenará todos los bi
 bn1=fx(2)+r*bn;
 Mbi(2)=bn1;
 i=3;
 while i<=n
 if i==3
 bi=fx(i)+r*bn1+s*bn;
 else
 bi=fx(i)+r*Mbi(i-1)+s*Mbi(i-2);
 end
 Mbi(i)=bi;
 i=i+1;
 end
 i=3;
 cn=bn;
 Mci(1)=cn;%Mci es una matriz que almacenará todos los ci
 cn1=bn1+r*cn;
 Mci(2)=cn1;
 while i<=n-1
 if i==3
 ci=Mbi(3)+r*cn1+s*cn;
 else
 ci=Mbi(i)+r*Mci(i-1)+s*Mci(i-2);
 end
 Mci(i)=ci;
 i=i+1;
 end
 
 %Se resuelve el sistema de ec
 b0=Mbi(n);
 b1=Mbi(n-1);
 c1=Mci(n-1);
 c2=Mci(n-2);
 c3=Mci(n-3);
 s1=((-b0*c2+c1*b1)/(-c3*c1+c2^2));
 r1=((-b1-c3*s1)/c2);
 r=r+r1;
 s=s+s1;
 %Error
 Er=abs((r1/r)*100);
 Es=abs((s1/s)*100);
 if ((abs (Er))&(abs(Es))<=Tol)%Cuando llegamos al error tolerado se calculan las raices en esa iteración
 cRoot=cRoot+1;
 x1=(r+sqrt((r^2)+4*s))/2;
 Roots(cRoot)=x1;
 x2=(r-sqrt((r^2)+4*s))/2;
 cRoot=cRoot+1;
 Roots(cRoot)=x2;
 parar=true;
 c=length(Mbi);
 while parar
 if abs(Mbi(c))>=0.0001
 break;
 else
 c=c-1;
 end
 end
 fx=sparse(1,1);
 while c>0
 fx(c)=Mbi(c);%Redefinimos fx
c=c-1;
 end
 n = length(fx);
 end
 else
 break
 end
end
if (n-1)==2%Cuando la ecuación es de segundo grado se resuelve con el método de fórmula general
 it=it+1;%Se incrementa en 1 la iteración
 disc=(Mbi(2)^2)-4*bn*Mbi(3);%Se calcula el discriminante
 x1=(-Mbi(2)+sqrt(disc))/2*bn;
 cRoot=cRoot+1;
 Roots(cRoot)=x1;
 x1=(-Mbi(2)-sqrt(disc))/2*bn;
 cRoot=cRoot+1;
 Roots(cRoot)=x1;
elseif (n-1)==1%Cuando la ecuación es de primer grado solamente se hace
la sustitución.
 it=it+1;%Se incrementa en 1 la iteración
 if (abs(fx(2))>=Tol)
 cRoot=cRoot+1;
 x1=-fx(2)/fx(1);
 
 else
 x1=0;
 end
 
Roots(cRoot)=x1;
x1;
end
if (n-1)==0%si el valor de la ecuacion que se introduce es una constante
disp('La ecuación no presenta incógnitas, es una constante igual a:\n\n')
constante=fx
end
Roots