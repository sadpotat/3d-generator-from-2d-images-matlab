function [topx, topy, frontx, fronty, sidex, sidey] = mapCoordinates(sample_size, top_image, front_image, side_image)

    [topx, topy] = getCoordinates(sample_size, top_image);
    [frontx, fronty] = getCoordinates(sample_size, front_image);
    [sidex, sidey] = getCoordinates(sample_size, side_image);
    
    