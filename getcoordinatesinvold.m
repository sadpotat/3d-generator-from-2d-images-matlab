function[xs,Y] = getcoordinatesinv(pic)

%object separation
lab_pic = rgb2lab(pic);
ab = lab_pic(:,:,2:3);
ab = im2single(ab);
nColors = 3;
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',1);
mask2 = pixel_labels==2;
outputpic = pic .* uint8(mask2);

%coordinate generation
I = rgb2gray(outputpic);
Ibw=im2bw(I,graythresh(I));
Ifill=imfill(Ibw,'holes');
figure
imshow(Ifill)

xs = 1:5:size(Ifill,1);
Y = zeros(2,length(xs));

for i = 1:length(xs)
    y1 = Ifill(xs(length(xs)-i+1),:);
    for j=1:length(y1)
        %loop runs from left to right
        if y1(j)==1
            Y(2,i)=j;
            break
            %stops at highest layer of y
        else 
            Y(2,i)=0;
            %if all zero, no index are taken as y values
        end
    end
    for k=1:length(y1)
        %loop runs from bottom to top
        if y1(length(y1)-k+1)==1
            Y(1,i)=length(y1)-k+1;
            break
        else 
            Y(1,i)=0;
        end
    end
end
end
