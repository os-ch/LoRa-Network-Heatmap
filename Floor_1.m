strength = [-93.8 -99.5625 -87.21428571 -80.66666667 -89.33333333 -98.90909091 -105.2 -99.25 -94.16666667]';

X = [106 343 524 578 654 811 1081 802 369]';
Y = [338 340 353 236 125 131 127 334 136]';

strengthPercent = 2*(strength+100)/100;

[I,m] = imread('Floor_1.png');
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