strength = [-74.8 -106.4 -105.2 -94.2 -90.8 -90.3 -109 -109 -101]';

X = [183 343 504 598 654 754 1138 829 369]';
Y = [355 340 393 236 125 188 181 334 116]';

strengthPercent = 2*(strength+100)/100;

[I,m] = imread('Floor_0.png');
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