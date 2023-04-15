function [sideheightx, sideheighty] = SidefaceHeight(sample_size, top_image)
    top_image = rot90(top_image, 1);
    top_image = fliplr(top_image);
    [sideheighty, sideheightx] = getCoordinates(sample_size, top_image);