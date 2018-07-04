function img = PrewittGradDetector(image)

% Calculates the 3x3 Sobel Gradient Detector given an input image
%
% img = output image (gradient-detected)
% image = input image name as string

B=imread(image);

if size(B,3)==3
    B = double(rgb2gray(B));
end

if size(B,3)<3
B = double((B));
end
Dx = [-1 0 1; -1 0 1; -1 0 1];
Dy = [-1 -1 -1; 0 0 0; 1 1 1];

[M,N] = size(B);

img=zeros(M,N);
img= double(img);

for i = 2:M-1   
    for j = 2:N-1
      Gx=Dx(1,1)*B(i-1,j-1)+Dx(1,2)*B(i-1,j)+Dx(1,3)*B(i-1,j+1)+Dx(2,1)*B(i,j-1)+ Dx(2,2)*B(i,j)+Dx(2,3)*B(i,j+1)+Dx(3,1)*B(i+1,j-1)+Dx(3,2)*B(i+1,j)+Dx(3,3)*B(i+1,j+1);
      Gy=Dy(1,1)*B(i-1,j-1)+Dy(1,2)*B(i-1,j)+Dy(1,3)*B(i-1,j+1)+Dy(2,1)*B(i,j-1)+ Dy(2,2)*B(i,j)+Dy(2,3)*B(i,j+1)+Dy(3,1)*B(i+1,j-1)+Dy(3,2)*B(i+1,j)+Dy(3,3)*B(i+1,j+1);
      img(i-1,j-1)=sqrt(power(Gx,2)+power(Gy,2));
    end
end

Gr2= uint8(img);
% Show the result
figure; imshow(Gr2); title('Prewitt  3x3 filtered image');
