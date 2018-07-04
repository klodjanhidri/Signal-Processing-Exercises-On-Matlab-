function G = SobelGradDetector(image)

% Calculates the 3x3 Sobel Gradient Detector given an input image
%
% img = output image (gradient-detected)
% image = input image name as string
A=imread(image);
if size(A,3)==3
A = double(rgb2gray(A));
end

if size(A,3)<3
A = double((A));
end

[M,N] = size(A);
Dx = [-1 0 1; -2 0 2; -1 0 1];
Dy = [1 2 1; 0 0 0; -1 -2 -1];
G=zeros(M,N);
G= double(G);


for i = 2:M-1   
    for j = 2:N-1
      Gx=Dx(1,1)*A(i-1,j-1)+Dx(1,2)*A(i-1,j)+Dx(1,3)*A(i-1,j+1)+Dx(2,1)*A(i,j-1)+ Dx(2,2)*A(i,j)+Dx(2,3)*A(i,j+1)+Dx(3,1)*A(i+1,j-1)+Dx(3,2)*A(i+1,j)+Dx(3,3)*A(i+1,j+1);
      Gy=Dy(1,1)*A(i-1,j-1)+Dy(1,2)*A(i-1,j)+Dy(1,3)*A(i-1,j+1)+Dy(2,1)*A(i,j-1)+ Dy(2,2)*A(i,j)+Dy(2,3)*A(i,j+1)+Dy(3,1)*A(i+1,j-1)+Dy(3,2)*A(i+1,j)+Dy(3,3)*A(i+1,j+1);
      G(i-1,j-1)=sqrt(power(Gx,2)+power(Gy,2));
    end
end


Gr1= uint8(G);
figure; imshow(Gr1); title('Sobel 3x3 filtered image');
