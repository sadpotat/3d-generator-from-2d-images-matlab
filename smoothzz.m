function [mzz]= smoothzz(mz,mzz)

if mzz(1,1)~=mz(1,1)
    if mzz(1,1)>mz(1,1)
        x=mzz(1,1)-mz(1,1);
        for i=1:length(mzz)
            mzz(1,i)=mzz(1,i)-x;
        end
    end
    if mzz(1,1)<mz(1,1)
        x=mz(1,1)-mzz(1,1);
        for i=1:length(mzz)
            mzz(1,i)=mzz(1,i)+x;
        end
    end
end
if mzz(2,1)~=mz(2,1)
    if mzz(2,1)>mz(2,1)
        x=mzz(2,1)-mz(2,1);
        for i=1:length(mzz)
            mzz(2,i)=mzz(2,i)-x;
        end
    end
    if mzz(2,1)<mz(2,1)
        x=mz(2,1)-mzz(2,1);
        for i=1:length(mzz)
            mzz(2,i)=mzz(2,i)+x;
        end
    end
end
end