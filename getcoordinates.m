function[xs,ys] = getcoordinates(sample,pic)

I = rgb2gray(pic);
Ibw=im2bw(I,graythresh(I));
Ifill = imfill(Ibw,'holes');

xs1 = 1:sample:size(Ifill,2);
xs = zeros(2,length(xs1));
ys = zeros(2,length(xs1));

for i = 1:length(xs1)
    y1 = Ifill(:,xs1(i));
    for j=1:length(y1)
        %loop runs from top to bottom
        if y1(j)==1
            ys(1,i)=length(y1)-j+1;
            xs(1,i)=xs1(i);
            break
            %stops at highest layer of y
        else 
            ys(1,i)=0;
            xs(1,i)=0;
            %if all zero, no index are taken as y values
        end
    end
    for k=1:length(y1)
        %loop runs from bottom to top
        if y1(length(y1)-k+1)==1
            ys(2,i)=k;
            xs(2,i)=xs1(i);
            break
        else 
            ys(2,i)=0;
            xs(2,i)=0;
        end
    end
end
end

