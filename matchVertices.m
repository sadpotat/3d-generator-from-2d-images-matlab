function [mtopx,mtopy,mfrontx,mfrontz,msidey,msidez] = matchVertices(topx,topy,frontx,frontz,sidey,sidez)

[top_startp, top_endp] = getStartEnd(topx);
[front_startp, front_endp] = getStartEnd(frontx);
[side_startp, side_endp] = getStartEnd(sidey);

to_be_truncated = (top_startp-top_endp)-(front_startp-front_endp);
if to_be_truncated>0 % top has more points
    [topx, topy, top_startp, top_endp] = truncatePairs(to_be_truncated, top_startp, top_endp, topx, topy);
elseif to_be_truncated<0 % front has more points
    [frontx, frontz, front_startp, front_endp] = truncatePairs(to_be_truncated, front_startp, front_endp, frontx, frontz);
end
    
mtopx = circshift(topx, [0, -(top_startp-1)]);
mtopy = circshift(topy, [0, -(top_startp-1)]);
mfrontx = circshift(frontx, [0, -(front_startp-1)]);
mfrontz = circshift(frontz, [0, -(front_startp-1)]);