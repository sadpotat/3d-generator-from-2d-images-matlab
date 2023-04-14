function [mxs,mys,mx,my,mz,mzz]= getMatrix(sx,sy,x,y,z,zz)

%
[mxs,my,mz] = Shrink3(sx,y,z);
disp('first triplet done');
[mys,mx,mzz] = Shrink3(sy,x,zz);
disp('second triplet done');
end