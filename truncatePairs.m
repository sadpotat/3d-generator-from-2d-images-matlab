function [x, y, startp, endp] = truncatePairs(to_be_truncated, startp, endp, x, y)
    while (to_be_truncated~=0)
        x(:,startp)=zeros(2,1);
        y(:,startp)=zeros(2,1);
        startp = startp+1;
        to_be_truncated = to_be_truncated -1;
        if to_be_truncated==0
            break
        end
        x(:,endp)=zeros(2,1);
        y(:,endp)=zeros(2,1);
        endp = endp-1;
        to_be_truncated = to_be_truncated -1;
    end