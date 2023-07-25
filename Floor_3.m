strength = [-102.6153846 -92.41666667 -78.63636364 -86.91666667 -99.45454545 -110.5 -101.25 -82.83333333]';

X = [92 335 578 664 826 1035 802 369]';
Y = [346 349 236 132 114 111 334 136]';

strengthPercent = 2*(strength+100)/100;

[I,m] = imread('Floor_3.png');
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