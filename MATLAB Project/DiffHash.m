function [hash] = DiffHash(img)
%DiffHash is a function that converts an m-by-(n+1) greyscale image into a
%hash containing mn bits using the differential hashing algorithm, reducing
%fingerprint size by comparing each pixel value to the pixel value to the
%right of itself in the greyscale image

%Input: An m-by-(n+1) uint8 array representing a greyscale image
%Output: A 1-by-mn logical row vector representing the differential hash of
%the greyscale image

%Switching the data type to carry out arithmetic
img = double(img);

%Calculating the size of the inputted image array:
sz = size(img);
rows = sz(1);
columns = sz(2);
columns = columns -1;

%Preallocating the logical array
hash = false(1, columns*rows);

%Comparing each pixel value in the array to the pixel to the right
x = 1;
for i = 1:rows
    for j = 1:columns
        pixelvalue = img(i, j);
        rightvalue = img(i, j+1);

        %Assigning a logical true/false depending on the compared value
        if pixelvalue >= rightvalue
            hash(x) = true;
            x = x+1;
        elseif pixelvalue < rightvalue
            hash(x) = false;
            x = x+1;
            continue
        end
    end
end


