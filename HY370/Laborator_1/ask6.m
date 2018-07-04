a(1)=1;
a(2)=0.1;
a(3)=-0.06;
b(1)=1;
b(2)=-2;

n=-1:10;
y1 =2*heaviside(n+1);
y2 =4*heaviside(n);
 
 y1(1)=2;
 y2(2)=4;
 
 x=y1-y2;
x1=x(1:11);
y=filter(b,a,x1);
n=0:10;
figure; stem(n,y);xlabel('Eksisosi Diaforwn erwtisis [i]');                            	% Visualize
title('y[n]+0.1y[n-1]+0.06[n-2]=x[n]-2[n-1]');


a(1)=1;
a(2)=2.1;
a(3)=-0.26;
b(1)=1;
b(2)=-2;

n=-1:10;
y1 =2*heaviside(n+1);
y2 =4*heaviside(n);
 
 y1(1)=2;
 y2(2)=4;
 
 x=y1-y2;
x1=x(1:11);
y=filter(b,a,x1);
n=0:10;
 figure; stem(n,y);xlabel('Eksisosi Diaforwn erwtisis [iii]');                            	% Visualize
title('y[n]+1.1y[n-1]-0.26[n-2]=x[n]-2[n-1]'); 