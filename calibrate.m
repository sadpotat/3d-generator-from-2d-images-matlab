function[f] = calibrate(image,length)

img = separateobj1(image, 3, 1);
[~,y]=getCoordinates(1,img);

%height of object
x=max(y(1,:))-min(y(2,:));
f=length/x;
end

