function[resized] = ResizeBox(img, resizedimensions)
%ResizeBox is a function that uses the box sampling algorithm to resize an
%image to the specified dimensions.

%Input:
%An m-by-n-by-p uint8 array representing a greyscale (p = 1) or a RGB
%colour (p=3) image.
%A 1-by-2 double array containing two values (i, j) representing the
%desired height i (i.e., i rows) and width j (i.e., j columns) to resize
%the image to.

%Output:
%An i-by-j-by-p uint8 array representing the resized greyscale (p = 1) or
%RGB colour (p = 3) image.

% Author: Eileen Qiu

%Switching the data type to carry out arithmetic
img = double(img);

%Calculating the size of the inputted image array:
sz = size(img);
rows = sz(1);
columns = sz(2);

% Initialize the resized image
resized = uint8(zeros(resizedimensions(1), resizedimensions(2)));

%Calculating the dimensions of the bounding boxes that divide the original
%image into the same number of boxes as pixels in the resized image.
boxheight = round(rows/(resizedimensions(1)))
boxlength = round(columns/(resizedimensions(2)))


%Calculating the number of boxes down each row/column
heightboxno = floor(rows/boxheight)
lengthboxno = floor(columns/boxlength)

%Resizing the image by calculating the total pixel value from each box
totalboxvalue = zeros(heightboxno, lengthboxno); %Preallocating size of array
x = 1; %Position in array
for i = 1:heightboxno
    for j = 1:lengthboxno
        for k = 1:boxheight
            for l = 1:boxlength
                totalboxvalue(x) = totalboxvalue(x) + img(l+((j-1)*(boxlength)), k+((i-1)*boxheight));
            end
        end
        x = x+1;
    end
end

%Considering the possibility of the image array being in RGB colour
%Calculating the total green pixel value
x = 1;
y = 1; %Array positions
if ndims(img) == 3
    totalboxvalue(:, :, 2) = zeros(heightboxno, lengthboxno);
    for i = 1:heightboxno
        for j = 1:lengthboxno
            for k = 1:boxheight
                for l = 1:boxlength
                    totalboxvalue(x, y, 2) = totalboxvalue(x, y, 2) + img(l+((j-1)*(boxlength)), k+((i-1)*boxheight), 2);
                end
            end
            x = x+1;
        end
        x = 1;
        y = y+1;
    end

    %Calculating the total blue pixel value
    x = 1;
    y = 1; %Array positions
    totalboxvalue(:, :, 3) = zeros(heightboxno, lengthboxno);
    for i = 1:heightboxno
        for j = 1:lengthboxno
            for k = 1:boxheight
                for l = 1:boxlength
                    totalboxvalue(x, y, 3) = totalboxvalue(x, y, 3) + img(l+((j-1)*(boxlength)), k+((i-1)*boxheight), 3);
                end
            end
            x = x+1;
        end
        x = 1;
        y = y+1;
    end
end

%Calculating the average pixel value from each box
avgpixelvalue = round(totalboxvalue./(boxheight*boxlength));

%Building the resized image array
x = 1;
resized = zeros(resizedimensions(1), resizedimensions(2));
for i = 1:resizedimensions(1)
    for j = 1:resizedimensions(2)
        resized(j,i) = avgpixelvalue(x);
        x = x+1;
    end
end

%Considering the possibility of the image array being in RGB colour
if ndims(img) == 3
    resized(:, :, 2) = zeros(resizedimensions(1), resizedimensions(2));
    resized(:, :, 3) = zeros(resizedimensions(1), resizedimensions(2));
    for i = 1:resizedimensions(1)
        for j = 1:resizedimensions(2)
            resized(j, i, 2) = avgpixelvalue(j, i, 2);
            resized(j, i, 3) = avgpixelvalue(j, i, 3);
        end
    end
end

%Converting the data type back to uint8 for storage efficiency
resized = uint8(resized);




