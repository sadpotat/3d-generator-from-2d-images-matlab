function[f] = calibrate(img,length)

[x,y]=getcoordinates3(1,img);
st=0;
en=0;
for i=1:size(y,2)
    if y(1,i)>0
        st=i;
        break
    end
end
for i=1:size(y,2)
    if y(1,(size(y,2)-i+1))>0
        en=size(y,2)-i+1;
        break
    end
end
j=1;
for i=st:en
    x(1,j)=y(1,i);
    x(2,j)=y(2,i);
    j=j+1;
end

%height of object
x=max(y(1,:))-min(y(2,:));
f=length/x;
end

