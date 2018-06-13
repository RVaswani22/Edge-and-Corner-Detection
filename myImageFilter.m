function[img1]=myImageFilter(img0,h)
original=imread(img0);
b=im2double(original);
[m,n]=size(original);
b=padarray(b,[1 1],'both');
for i=1:m-2;
for j=1:m-2;
P(i,j)=h(1,1)*b(i,j)+h(1,2)*b(i,j+1)+h(1,3)*b(i,j+2)+h(2,1)*b(i+1,j)+h(2,2)*b(i+1,j+1)+h(2,3)*b(i,j+2)+h(3,1)*b(i+2,j)+h(3,2)*b(i+2,j+1)+h(3,3)*b(i+2,j+2);
end;
end;
img1=P;

end
