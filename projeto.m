close all; clear all;

v = VideoReader('1859.mp4');
v.CurrentTime = 650 / 50;
frame = readFrame(v);
figure 
imshow(frame);
frame = rgb2gray(frame);

gstr = fspecial('gaussian', [3 3]);
filtered = imfilter(frame, gstr);
% filtered = frame;
% imshow(filtered);

% fun = @(myBlock) adaptThStd(myBlock.data);
% gath = blockproc(filtered, [3 3], fun); % processa
gath = imbinarize(frame, 'adaptive','ForegroundPolarity','bright','Sensitivity',0.4);
figure, imshow(gath), title('gath')
% 
estr = ones(3,3);
erosionStr = strel('line', 20, 90);
eroded = imerode(gath, erosionStr);
% 
% fun = @(myBlock) novelErosion(myBlock.data);
% eroded = blockproc(gath, [3 3], fun); % processa
figure, imshow(eroded), title('com erosao')

