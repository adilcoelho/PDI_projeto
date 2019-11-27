function y = novelErosion(image)

sum_of_ones = sum(image(:));

size_of_image = size(image);
if (sum_of_ones > size_of_image(1))
    y = 0;
else
    y = image(1,1);
end