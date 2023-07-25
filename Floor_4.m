strength = [-102.4285714 -95.15384615 -95.57142857 -87 -86.16666667 -105.7272727 -110.6666667 -101.4285714 -93.33333333]';

X = [176 327 524 578 579 797 1031 802 369]';
Y = [345 344 340 236 83 111 107 334 136]';

strengthPercent = 2*(strength+100)/100;

[I,m] = imread('Floor_4.png');
height=480;
width=1250;
OverlayImage=[];
F = scatteredInterpolant(Y, X, strengthPercent,'natural');
for i = 1:height-1
   for j = 1:width-1
          OverlayImage(i,j) = F(i,j);
   end
end
alpha = (~isnan(OverlayImage))*0.4;
imshow(I,m);
hold on

h = imshow(OverlayImage);

colormap(h.Parent, hsv);
colorbar(h.Parent);
set(h,'AlphaData',alpha); 