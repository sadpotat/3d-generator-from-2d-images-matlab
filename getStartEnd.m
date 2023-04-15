function [startp, endp] = getStartEnd(rows)
    startp = 0;
    endp = 0;
    length = size(rows,2);
    for i=1:length
        if rows(1,i)>0
            startp=i;
            break
        end
    end
    for i=1:length
        if rows(1,(length-i+1))>0
            endp=length-i+1;
            break
        end
    end
end