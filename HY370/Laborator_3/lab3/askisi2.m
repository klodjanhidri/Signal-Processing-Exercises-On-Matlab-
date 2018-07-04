A=imread('/home/klodjan/MEGA/simeiosis/HY370/Laborator_3/circuit.tif','tif');
figure;imshow(A);
A = double(A);

[M,N] = size(A);
B=zeros(M,N);
a = 0.95;
G=20;
Num = 1/G;
Den = [1 -a];
for i = 1:M
    Al =A(i,:);                
    Y =filter(Num,Den,Al);
    B(i,:) =Y;
end
figure;title('Filtering with h1[n]=0.95^n*u[n] in rows') ; imshow(uint8(B));

B1=zeros(M,N);
for i = 1:N
    Al =A(:,i);                
    Y =filter(Num,Den,Al);
    B1(:,i) =Y;
end
figure;title('Filtering with h1[n]=0.95^n*u[n] in columns') ;imshow(uint8(B1));

%========================filter_with h2[n]==================

B=zeros(M,N);
a = 0.95;
G=0.05;
Num =[1 -a];
Den =G;
for i = 1:M
    Al =A(i,:);                
    Y =filter(Num,Den,Al);
    B(i,:) =Y;
end
figure;title('Filtering with h2[n]=d[n]-0.95d[n-1] in rows') ; imshow(uint8(B));

B1=zeros(M,N);
for i = 1:N
Al =A(:,i);                
Y =filter(Num,Den,Al);
B1(:,i) =Y;
end
figure;title('Filtering with h1[n]=d[n]-0.95d[n-1] in columns') ;imshow(uint8(B1));