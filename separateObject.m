function outputpic= separateObject(pic)
%object separation
lab_pic = rgb2lab(pic);
ab = lab_pic(:,:,2:3);
ab = im2single(ab);
nColors = 3;
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',1);
mask2 = pixel_labels==2;
outputpic = pic .* uint8(mask2);