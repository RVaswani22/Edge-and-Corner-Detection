function [R] = myHarrisCorner(B, C, thresh,Io)
[m,n]=size(B);
P(1:m,1:n)=0;
k=0.04; 
cim = ((B.*B).*(C.*C) - (B.*C.^2)) - k.*((B.*B) + (C.*C)).^2; 
sze = 2*5+1;                   % Size of mask.
mx = ordfilt2(cim,sze^2,ones(sze)); % Grey-scale dilate.
cim = (cim==mx)&(cim>thresh);       % Find maxima.
[r,c] = find(cim);
 figure, imshow(Io), hold on
	    plot(c,r,'xg');
        title('Corner Detection');
end
