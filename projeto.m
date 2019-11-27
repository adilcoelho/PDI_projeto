close all;
video = VideoReader('GOPR1859 - Segment1(00_00_28.000-00_01_03.000).mp4');
filename=strcat('frame',num2str(200),'.png');
frame = read(video, 300);
imwrite(frame,filename);
im = imread('frame200.png');
gray = rgb2gray(im);
BW = imbinarize(gray, 'adaptive','ForegroundPolarity','bright','Sensitivity',0.4);
figure, imshow(BW)

BWsize = size(BW);
se = strel('square',4);
%BW = imdilate(BW, se);
%erodida = bwmorph(BW,'skel',inf);
 erodida2 = bwmorph(BW,'spur',inf);
 bridge = bwmorph(erodida2,'bridge');
 BW2 = bwmorph(bridge,'remove');
% windowSize = 2;
% erodida = zeros(BWsize);
% for i = 1:1:BWsize(1)-(windowSize-1)
%     for j = 1:1:BWsize(2)-(windowSize-1) 
%         erodida(i,j) = novelErosion(BW(i:i+windowSize-1, j:j+windowSize-1));
%     end
% end
figure
imshow(BW2)
hold on;
[H, theta, rho] = hough(BW2);
P=houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
lines=houghlines(BW2,theta,rho,P,'FillGap',50,'MinLength',7);

for k=1:length(lines)
    xy=[lines(k).point1; lines(k).point2];
    
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','red');
end
