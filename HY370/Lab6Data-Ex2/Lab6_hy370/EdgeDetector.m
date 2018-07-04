function img = EdgeDetector(image, method)
%
% Calculates the a 3 x 3 Prewitt or Sobel Edge Detector given an input image
%
% img = output image (edge-detected)
% image = input image name as string
% method = string ’sobel’ or ’prewitt’
%
% This function should call PrewittGradDetector.m or SobelGradDetector.m
%
% Careful! : Only 3x3 methods will be implemented in this function!

if strcmp(method, 'sobel')
    img=SobelGradDetector(image);
    T=max(max(img))/8;
    [M N]=size(img);
    for i = 1:M   
        for j = 1:N
            t=img(i,j);
            if(t<T)
                img(i,j)=0;
            end
            if(t>T)
                img(i,j)=255;
            end
        end
    end

Gr= uint8(img);
% Show the result
figure; imshow(Gr); title('Binary image Sobel 3x3 filtered');
    
elseif strcmp(method, 'prewitt')
    img=PrewittGradDetector(image);
        T=max(max(img))/8;
    [M N]=size(img);
    for i = 1:M   
        for j = 1:N
            t=img(i,j);
            if(t<T)
                img(i,j)=0;
            end
            if(t>T)
                img(i,j)=255;
            end
        end
    end

Gr= uint8(img);
figure; imshow(Gr); title('Binary image Prewitt 3x3 filtered');
else
error('Method not found!');
end