function [image] = ImageSeparateByMode(type, input_image)
    if type==2
        imagep=separateobj1(input_image, 3, 1);
    elseif type==3
        image=separateobj1(input_image, 3, 2);
    elseif type==4
        image=separateobj2(input_image);
    else 
        image=separateobj1(input_image, 1, 2);
    end
end