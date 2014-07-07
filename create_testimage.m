% create_testimage.m

%% general
imsize = [512,512];
prefix = [datestr(now,'yymmdd-HHMMSS'),'-'];
imgName = ['stripe_skew.bmp'];
img = double(zeros(imsize));

%% configuration

% idxs_x = 1:imsize(2); idxs_y = 1:imsize(1);
[idxs_y,idxs_x] = meshgrid(1:imsize(1),1:imsize(2));
idxs = idxs_y+idxs_x;

% img(idxs<256) = 0.25;
img(idxs>=256 & idxs<512) = 0.25;
img(idxs>=512 & idxs<768) = 0.50;
img(idxs>=768 & idxs<1024) = 0.75;

imwrite(img,fullfile('~/Desktop/',[prefix,imgName]),'BMP');
