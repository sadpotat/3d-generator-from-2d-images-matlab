function[xs,Y] = getcoordinatesinv(sample,pic)

I = rgb2gray(pic);
Ibw=im2bw(I,graythresh(I));
Ifill=imfill(Ibw,'holes');

xs = 1:sample:size(Ifill,1);
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
