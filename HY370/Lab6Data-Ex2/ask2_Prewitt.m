A=imread('/home/klodjan/MEGA/simeiosis/HY370/Lab6Data-Ex2/peppers.png','png');
figure;imshow(A);
A = double(A);

[M,N] = size(A);
B=zeros(M,N);

DD_deltax=[-1,0,1];
DD_deltay=[-1;0;1];



C = zeros(M,N);
C = double(C);
CC = zeros(M,N); 
CC= double(CC);
tmp=0;
for i = 1:M  
    x=A(i,:);
    for j = 1:N
        tmp=DD_deltax(1)*x(j);
        if(j<N)
            tmp1=DD_deltax(2)*x(j+1);
            
            if(j<N-1)
            tmp2=DD_deltax(3)*x(j+2);
            end
        end
        tmp=tmp+tmp1+tmp2; 
        C(i,j)=tmp;
           
    end
end
 

for j = 1:N
       x=A(:,j);      
       for jj=1:M
        tmp=DD_deltay(1)*x(jj);
        if(jj<M)
            tmp1=DD_deltay(2)*x(jj+1);
            
            if(jj<M-1)
            tmp2=DD_deltax(3)*x(jj+2);
            end
        end
        tmp=tmp+tmp1+tmp2; 
        CC(j,jj)=tmp;   
       end
end
h=0.5;
Gxv=filter(h,1,C);
Gxu=filter(h,1,CC);
I=zeros(M,N);

II=zeros(384,512);
for  i= 1:M
     for j=512:1024
         
       II(i,j-511)=sqrt(power(C(i,j),2)+power(CC(i,j),2));  
     end
end

II= uint8(II);
% Show the result
figure; imshow(II); title('Prewitt 1x3 filtered image');


