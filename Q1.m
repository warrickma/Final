k_cat=0.4; % s^-1
K_ATP=0.42; % mM
K_F6P=0.11; % mM
F6P=0.1; % F6P concentration mM
ATP=2.3; % ATP concentration mM
E=0.12; % PFK concentration microM
r1=k_cat*E*(F6P/(K_F6P+F6P))*(ATP/(K_ATP+ATP))*3600; % compute rate with no regulation in microM/h
syms W1
solW1=solve(3.003==r1*W1/(1+W1),W1); % solve for W1
solW1;

fun=@(b,AMP) r1.*(0.0451+80.*(AMP./b(1)).^b(2))./(1+0.0451+80.*(AMP./b(1)).^b(2)); % b(1)=Ki; b(2)=n
b0=[1;0];
B=lsqcurvefit(fun,b0,AMP,rate); % B(1)=Ki; B(2)=n
AMP_fit=linspace(AMP(1),AMP(end));
sd=confidence./2; % calculate error from 95% confidence interval
errorbar(AMP,rate,sd,'ko');
hold on;
plot(AMP_fit,fun(B,AMP_fit),'b-');
hold off;
xlabel('AMP concentration (mM)');
ylabel('rate (microM/h)');



