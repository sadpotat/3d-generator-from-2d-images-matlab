function [a,b,c] = Shrink3(xs,y,z)
d=0;
e=0;
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
    yk(1,j)=y(1,i);
    yk(2,j)=y(2,i);
    xsk(1,j)=xs(1,i);
    j=j+1;
end


st=0;
en=0;
for i=1:size(z,2)
    if z(1,i)>0
        st=i;
        break
    end
end
for i=1:size(z,2)
    if z(1,(size(z,2)-i+1))>0
        en=size(z,2)-i+1;
        break
    end
end
j=1;
for i=st:en
    zk(1,j)=z(1,i);
    zk(2,j)=z(2,i);
    xsk(1,j)=xs(1,i);
    j=j+1;
end
s=[length(xsk) length(yk) length(zk)];
s=max(s);
if size(xsk)<s
    i=1;
    while size(xsk,2)<s
        xsk(length(xsk)+i)=xsk(length(xsk))+xsk(2)-xsk(1);
    end
end
if size(yk,2)<s
    i=1;
    while size(yk,2)<s
        yk(:,(size(yk,2)+i))=yk(:,(size(yk,2)));
    end
end
if size(zk,2)<s
    i=1;
    while size(zk,2)<s
        zk(:,(length(zk)+i))=zk(:,(length(zk)));
    end
end

    
a=xsk-xsk(1)*ones(size(xsk));
b=yk-yk(2,1)*ones(size(yk));
c=zk-zk(2,1)*ones(size(zk));
end