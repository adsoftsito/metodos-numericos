clear, clc

x = [
1 130;
1 650;
1 99;
1 150;
1 128;
1 302;
1 95;
1 945;
1 368;
1 961;
]

%y = [
%15.0
%69.9
%6.5
%22.4
%28.4
%65.9
%19.4
%198.7
%38.8
%138.2
%]

y = [
186;
699;
132;
272;
291;
331;
199;
1890;
788;
1601;
]

b = x\y;
b = b.'

b1 = b(2)
b0 = b(1)

xserie = x(:,2)
xserie
yCalc = b0 + b1*xserie
yCalc

scatter(xserie, y)
hold on
plot(xserie, yCalc)

xlabel('Estimated proxy size')
ylabel('Actual added and modified size')

xk = 386
yk = b0 + b1 * xk
xk
yk

# calculo de R^2
R2 = 1 - sum((y - yCalc).^2)/sum((y - mean(y)).^2)
R2

mytitle = ['Linear regression relation between x and y, R ' num2str(xk) ' ' num2str(yk) ' ' num2str(R2)]
mytitle 
title(mytitle)
grid on