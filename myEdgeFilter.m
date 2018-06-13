function[Io,Ix,Iy,Im]=myEdgeFilter(img,sigma)
clc;
Io=img;
original=img;
original=imread(img);
b=im2double(original);
[m,n]=size(original);
h=fspecial('gaussian',3,sigma);
P(1:m,1:n)=0;
for i=1:m-2;
for j=1:m-2;
P(i,j)=h(1,1)*b(i,j)+h(1,2)*b(i,j+1)+h(1,3)*b(i,j+2)+h(2,1)*b(i+1,j)+h(2,2)*b(i+1,j+1)+h(2,3)*b(i+1,j+2)+h(3,1)*b(i+2,j)+h(3,2)*b(i+2,j+1)+h(3,3)*b(i+2,j+2);
end;
end;
Im=P;
h=[1,2,1;0,0,0;-1,-2,-1];
PP(1:m,1:n)=0;
for i=1:m-2;
for j=1:m-2;
PP(i,j)=h(1,1)*b(i,j)+h(1,2)*b(i,j+1)+h(1,3)*b(i,j+2)+h(2,1)*b(i+1,j)+h(2,2)*b(i+1,j+1)+h(2,3)*b(i+1,j+2)+h(3,1)*b(i+2,j)+h(3,2)*b(i+2,j+1)+h(3,3)*b(i+2,j+2);
end;
end;
h=transpose(h);
R(1:m,1:n)=0;
for i=1:m-2;
for j=1:m-2;
R(i,j)=h(1,1)*b(i,j)+h(1,2)*b(i,j+1)+h(1,3)*b(i,j+2)+h(2,1)*b(i+1,j)+h(2,2)*b(i+1,j+1)+h(2,3)*b(i+1,j+2)+h(3,1)*b(i+2,j)+h(3,2)*b(i+2,j+1)+h(3,3)*b(i+2,j+2);
end;
end;
Ix=PP;
Iy=R;
I0=PP+R;
figure;
imshow(Io)
title('Original Image');
figure;
imshow(Ix)
title('Sobel x-gradient');
figure;
imshow(Iy)
title('Sobel y-gradient');
figure;
imshow(I0)
title('Sobel x+y-gradient');

