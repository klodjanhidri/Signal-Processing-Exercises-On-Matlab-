A=imread('/home/klodjan/MEGA/simeiosis/HY370/Lab6Data-Ex2/peppers.png','png');
figure;imshow(A);
A = double(A);

[M,N] = size(A);
B=zeros(M,N);

D_deltax=[-1,1];
D_deltay=[-1;1];
C = zeros(M,N); 
C = double(C);
CC = zeros(M,N); 
CC= double(CC);

tmp=0;
for i = 1:M  
    x=A(i,:);
    for j = 1:N
        tmp=D_deltax(1)*x(j);
        if(j<N)
            tmp1=D_deltax(2)*x(j+1);
        end
        tmp=tmp+tmp1; 
        C(i,j)=tmp;
           
    end
end
 

for j = 1:N
    x=A(:,j);      
    for jj=1:M
        tmp=D_deltay(1)*x(jj);
        if(jj<M)
            tmp1=D_deltay(2)*x(jj+1);
        end
        tmp=tmp+tmp1; 
        CC(j,jj)=tmp;  
    end
end
h=0.8;
Gxv=filter(h,1,C);
Gxu=filter(h,1,CC);
I=zeros(M,N);
II=zeros(M,512);
for  i= 1:M
     for j=512:1024
       II(i,j-511)=sqrt(power(Gxv(i,j),2)+power(Gxu(i,j),2));  
     end
end

I= uint8(II);
% Show the result
figure; imshow(I); title('Sobel 1x2 filtered image');


