function get3d (htop,hfront,hleft,hright,hback,hbottom,sxk,syk,xk,yk,zk,zzk)
disp('Modelling in 3d...')

sxk=[sxk;sxk];
syk=[syk;syk];
y1=[yk(1,:);yk(1,:)];
y2=[yk(2,:);yk(2,:)];
z1=[zk(1,:);zk(1,:)];
z2=[zk(2,:);zk(2,:)];

x1=[xk(1,:);xk(1,:)];
x2=[xk(2,:);xk(2,:)];
zz1=[zzk(1,:);zzk(1,:)];
zz2=[zzk(2,:);zzk(2,:)];

figure
hold on
if hback==0
    surf(sxk,y1,zk)
end

if hfront==0
    surf(sxk,y2,zk)
end
if htop==0
    surf(sxk,yk,z1)
end
if hbottom==0
    surf(sxk,yk,z2)
end
if hright==0
    surf(x1,syk,zzk)
end
if hleft==0
    surf(x2,syk,zzk)
end
colormap summer
shading interp
hold off

end