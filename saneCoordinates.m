function [sx,sy,x,y,z,zz]=saneCoordinates(sample,top,front,side)

[sx,y]= getcoordinates(sample,top);
[sy2,x]= getcoordinatesinv(sample,top);

[sx2,z]= getcoordinates(sample,front);
[sy,rzz]= getcoordinates(sample,side);
[zz]=reverseit(rzz);

disp('Coordinates generated...')

function [r]=reverseit(x)
    for i=1:size(x,2)
        r(1,size(x,2)-i+1)=x(1,i);
        r(2,size(x,2)-i+1)=x(2,i);
    end
end

end