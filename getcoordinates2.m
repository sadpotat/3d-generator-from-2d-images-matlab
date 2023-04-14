function[xs,Y] = getcoordinates2(sample,pic)

I = rgb2gray(pic);
Ibw=im2bw(I,graythresh(I));
Ifill=imfill(Ibw,'holes');

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
