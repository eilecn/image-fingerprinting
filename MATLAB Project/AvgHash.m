function [fingerprint] = AvgHash(img)
%AvgHash is a function that uses the average hashing algorithm to convert
%an m-by-n greyscale image into a hash containing mn bits.

%Input: An m-by-n uint8 array representing a greyscale image.

%Output: A 1-by-mn logical row vector representing the average hash of the
%greyscale image.

%Author: Eileen Qiu

%Switching the data type to carry out arithmetic
img = double(img);

%Calculating the size of the inputted image array:
sz = size(img);
rows = sz(1);
columns = sz(2);
totalpixels = rows*columns;
avgpixelvalue = 0;

%Calculating the average pixel value:
for i = 1:rows
    for j = 1:columns
        avgpixelvalue = avgpixelvalue + img(i, j);
    end
end

avgpixelvalue = avgpixelvalue/totalpixels;
avgpixelvalue = round(avgpixelvalue);

%Preallocating the greyscalehash array size for efficiency:
fingerprint = false(1, totalpixels);

%Comparing each pixel value in the greyscale image array to the average
%pixel value and building the array:
x = 1;
for i = 1:rows
    for j = 1:columns
        if img(i, j) >= avgpixelvalue
            fingerprint(x) = true;
            x = x+1;
        else
            x = x+1;
            continue
        end
    end
end