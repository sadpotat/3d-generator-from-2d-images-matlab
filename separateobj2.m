function[bw2] = separateobj2(img)

img=rgb2gray(img);
msk=img>30;
props=regionprops(logical(msk),'Area');
msk = bwareaopen(msk,25);
msk = imclearborder(msk);
bw2 = bwareafilt(msk,1);
end
