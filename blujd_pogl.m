%pogl
clc
clear
n=30;
p=0.55;
q=1-p;                              
for i=1:n
    d(i)=0;
end                            
d(1)=1;
d(n)=1;
dp(1)=0;
for i=2:n-1
    dp(i)=p;                      
end
dq(n-1)=0;
for j=1:n-1
    dq(j)=q; 
end
dq(n-1)=0;
P=diag(d)+diag(dq,-1)+diag(dp,1);
p01=rand(1,n-4);
p02=p01/sum(p01);
p0=[0,0,p02,0,0];
x(1)=p0(1);
for i=2:n
    x(i)=x(i-1)+p0(i);
end
%   u=rand(1,1); 
%i=1; 
%while u>x(i) i=i+1; 
%end
%j=i;
for i=1:n
    Po(i)=0;
end
%n=10;
H(:,1)=P(:,1);  %начальные матрица суммарных вер-тей
H0=x(1);  
for i=2:n %и вектор суммарных 
      H(:,i)=H(:,i-1)+P(:,i); %пересчет матрицы суммарных вер-тей
      H0(i)=H0(i-1)+x(i);       %пересчет вектора суммарных вер-тей                              
  end
Q=H0; %начальный вектор  суммарных вер-тей
m=300; %число циклов моделирования
%s(1)=j
for k=1:m; 
       u=rand(1,1); %случайное число
i=1; 
while u>Q(i) i=i+1; 
    end
s(k)=i;
Q=H(i,:);  % новый вектор суммарных вер-тей  
end;

j=s(1)
Po(j)=1;
for i=1:300
    m(i)=1+10*(i-1);
    Pn(i,:)=Po*P^m(i);
end
Lim_pract=Pn(300,:)
figure(1)
plot(Pn)
Pinf=((q/p)^(j-1)-(q/p)^(n-1))/(1-(q/p)^(n-1));
Qinf=1-Pinf;
Lim_teor=[Pinf,Qinf]
figure(2)
plot(s,'r--*'), axis([0 300 0 31]), grid  %график переходов