function[output] = separateobj1(input, value, pixel_val)

lab_inp = rgb2lab(input);
ab = lab_inp(:,:,2:3);
ab = im2single(ab);
nColors = 3;
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',value);
mask1 = pixel_labels==pixel_val;
output = input .* uint8(mask1);
%figure,imshow(output)

end