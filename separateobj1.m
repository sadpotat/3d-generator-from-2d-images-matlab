function[output, output2] = separateobj1(input)

lab_inp = rgb2lab(input);
ab = lab_inp(:,:,2:3);
ab = im2single(ab);
nColors = 3;
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',3);
mask1 = pixel_labels==1;
output = input .* uint8(mask1);
%figure,imshow(output)
mask2 = pixel_labels==2;
output2 = input .* uint8(mask2);
%figure,imshow(output2)

end