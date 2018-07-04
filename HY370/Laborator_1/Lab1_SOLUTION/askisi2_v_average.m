B = imread('NoiseSaturn.tif');
[M,N]= size(B)          
C = zeros(M,N);   % Initialize C
B = double(B);    % Cast to double for processing
mask=zeros(1,3);  %mask for taking the mean of three neighburn pixels
index=0;
shift=3;
for i = 1:M   
    x=B(i,:);   % Apply a median filter in every row
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

%======================Median-Filter in Columns=========================

CC = zeros(M,N);   % Cast to double for processing
CC=double(CC);
C=double(C);
mask=zeros(3,1);
index=0;
shift=3;
  
for j = 1:N
    xx=C(:,j);  % Apply a median  filter in every column
    for jj=1:M
        if(jj<4)
            index=index+1;
            mask(index)=xx(jj);
                if(jj==3)
                    index=0;
                    y=mean(mask);
                    CC(jj-1,j)=y;
                end 
        end
        
        if(jj>3)
            temp=jj;
            for t= 1:3
                shift=shift-1;
                temp=temp-shift;
                index=index+1;
                mask(index)=xx(temp);
                temp=jj;
            end
        y=mean(mask);
        CC(jj-1,j)=y;
        shift=3;
        index=0;
        end 
    end  
end

CC = uint8(CC); % Cast it to unsigned int
% Show the result
figure; imshow(CC); title('MA-filtered image in rows and in columns');

