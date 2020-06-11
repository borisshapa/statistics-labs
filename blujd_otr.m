%otr
clc
clear
p=0.45; q=1-p; m(1)=q;
l=10;
for k=1:l
al(k)=p; 
m(k)=q; 
d(k)=0;
end
%or
%d=zeros(1,l+1);
%al=p*ones(1,l);
%m=q*ones(1,l);
d(1)=q; 
d(l+1)=p;
p01=rand(1,l-3); 
p02=p01/sum(p01);
p0=[0,0,p02,0,0];
y(1)=p0(1)
for i=2:l+1
    y(i)=y(i-1)+p0(i);
end
   u=rand(1,1); 
i=1; 
while u>y(i) i=i+1;
end
j=i
for i=1:l+1
    x(i)=0;
end
x(j)=1; 
P=diag(d)+diag(al,1)+diag(m,-1); 
Pn=x*P^500
for i=1:40
    Pn1(i,:)=x*P^(5*(i-1));
end
figure(1)
plot(5:5:200,Pn1)
%or plot(Pn1)
for j=1:l+1
Pinf(j)=(1-p/q)*(p/q)^(j-1)/(1-(p/q)^(l+1));
end
Pn1=Pinf
n=l+1;
H(:,1)=P(:,1); 
H0=x(1);  
for i=2:n 
      H(:,i)=H(:,i-1)+P(:,i); 
      H0(i)=H0(i-1)+x(i);                                 
  end
Q=H0;
m=120; 
for k=1:m;     
   u=rand(1,1); 
i=1; 
while u>Q(i) i=i+1; 
end
s(k)=i;              
Q=H(i,:);  
end;
figure(2)
plot(s,'r--*'); grid  %график переходов
A=P-eye(n); % 
A(:,n)=ones(n,1); %  
b=[zeros(1,n-1),1]; % строка свободных членов                    
pst=b*inv(A) % решение исправленной системы - 
             % теоретический вектор предельных вер-тей