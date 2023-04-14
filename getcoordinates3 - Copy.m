function[xs,Y] = getcoordinates3(sample,pic)

%object separation
img=rgb2gray(pic);
msk=img>30;
props=regionprops(logical(msk),'Area');
msk = bwareaopen(msk,25);
msk = imclearborder(msk);
bw2 = bwareafilt(msk,1);
Ifill = imfill(bw2,'holes');

xs = 1:sample:size(Ifill,2);
Y = zeros(2,length(xs));

for i = 1:length(xs)
    y1 = Ifill(:,xs(i));
    for j=1:length(y1)
        %loop runs from top to bottom
        if y1(j)==1
            Y(1,i)=length(y1)-j+1;
            break
            %stops at highest layer of y
        else 
            Y(1,i)=0;
            %if all zero, no index are taken as y values
        end
    end
    for k=1:length(y1)
        %loop runs from bottom to top
        if y1(length(y1)-k+1)==1
            Y(2,i)=k;
            break
        else 
            Y(2,i)=0;
        end
    end
end
end
