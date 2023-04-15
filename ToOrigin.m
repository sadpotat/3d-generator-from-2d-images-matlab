function [x, y] = ToOrigin(x, y)
    x_adjust=x(1,1);
    nonzeroes = y(y~=0);
    lowestp = min(nonzeroes); %%% might cause a bug
    length = size(y,2);
    for i=1:2
        for j=1:length
            if y(i,j)>0
                x(i,j) = x(i,j)-x_adjust;
                y(i,j) = y(i,j) - lowestp;
            end
        end
    end
end
            