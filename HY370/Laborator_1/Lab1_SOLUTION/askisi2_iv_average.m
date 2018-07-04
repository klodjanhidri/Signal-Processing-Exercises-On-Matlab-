B = imread('NoiseSaturn.tif');

[M,N]= size(B) ;         % Initialize C
C = zeros(M,N); % Cast to double for processing
C = double(C);
CC = zeros(M,N); 
B = double(B);
mask=ones(1,3);
index=0;
shift=3;
for i = 1:M   % Apply a moving average (MA) filter in every row
    x=B(i,:);
    for j = 1:N
        if(j<4)
            index=index+1;
            mask(index)=x(j);
            if(j==3)
                index=0;
                y=mean(mask);
                C(i,j-1)=y;
            end 
        end
        
        if(j>3)
            temp=j;                 
            for t= 1:3
                shift=shift-1;
                temp=temp-shift;
                index=index+1;
                mask(index)=x(temp);
                temp=j;
            end
         y=mean(mask);
         C(i,j-1)=y;
         shift=3;
         index=0;
        end
    end
 end
% Cast it to unsigned int
C = uint8(C);
% Show the result
figure; imshow(C); title('MA-filtered image in rows');


%===========================filter to colums=============================
mask=zeros(3,1);
   CCC=zeros(M,N);
   CCC = double(CCC);
   shift=3;
    for j = 1:N
       x=B(:,j);      % Apply a moving average (MA) filter in every colum
       for jj=1:M
           if(jj<4)
                index=index+1;
                mask(index)=x(jj);
                if(jj==3)
                    index=0;
                    y=mean(mask);
                    CCC(jj-1,j)=y;
                end 
           end
        
           if(jj>3)
               temp=jj;
               for t= 1:3
                    shift=shift-1;
                    temp=temp-shift;
                    index=index+1;
                    mask(index)=x(temp);
                    temp=jj;
               end
               y=mean(mask);
               CCC(jj-1,j)=y;
               shift=3;
               index=0;
           end 
       end
 
   end
 
% Cast it to unsigned int
CCC = uint8(CCC);
% Show the result
figure; imshow(CCC); title('MA-filtered image in colums');