function [resizeimage] = ResizeNearest(imagearray, resizearray)
%ResizeNearest is a function that uses the Nearest Neighbour Interpolation
%Algorithm to resize an image to the specified dimensions

%Inputs:

%An m-by-n-by-p uint8 array representing a greyscale (p = 1) or a RGB
%colour (p = 3) image.

%A 1-by-2 double array containing two values (i, j) representing the
%desired height i (i.e., i rows) and width j (i.e., j columns) to resize
%the image to.

%Output:

%An i-by-j-by-p uint8 array representing the resized greyscale (p = 1) or
%RGB colour (p = 3) image.

%Author: Eileen Qiu

%Switching the data type to carry out arithmetic
imagearray = double(imagearray);

%Calculating the size of the inputted image array:
sz = size(imagearray);
rows = sz(1);
columns = sz(2);

%Preallocating the greyscale array size for efficiency
resizeimage = zeros(resizearray(1), resizearray(2));

%Calculating the row and column size ratios between the input and output
%image:

rowratio = rows/(resizearray(1));
columnratio = columns/(resizearray(2));

%Calculating the relative positions of the resized pixel in the original
%image
for i = 1:resizearray(1)
    for j = 1:resizearray(2)
        relativerow = ceil((i-0.5)*rowratio);
        relativecolumn = ceil((j-0.5)*columnratio);

        %Assigning pixel values from relative positions to resized
        %positions
        resizeimage(i, j) = imagearray(relativerow, relativecolumn);

        %Considering the possibility of the image array being in RGB colour
        if ndims(imagearray) == 3
            red = imagearray(relativerow, relativecolumn, 1);
            green = imagearray(relativerow, relativecolumn, 2);
            blue = imagearray(relativerow, relativecolumn, 3);
        end

        %Assigning RGB values if required
        if ndims(imagearray) == 3
            resizeimage(i, j, 1) = red;
            resizeimage(i, j, 2) = green;
            resizeimage(i, j, 3) = blue;
        end

    end
end



%Converting the data type back to uint8 for storage efficiency
resizeimage = uint8(resizeimage);














