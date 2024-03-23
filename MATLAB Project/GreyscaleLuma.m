function[greyimage] = GreyscaleLuma(rgbimage)
%GreyscaleLuma is a function that converts a supplied RGB colour image to a
%greyscale version by calculating a weighted sum for each pixel

%Input: An m-by-n-by-3 uint8 array representing an RGB colour image
%Output: An m-by-n-by-1 uint8 array representing a greyscale image

%Author: Eileen Qiu

%Switching the data type to carry out arithmetic
rgbimage = double(rgbimage);

%Calculating the size of the inputted RGB colour image array
sz = size(rgbimage);
X = sz(1);
Y = sz(2);

%Preallocating the greyscale array size for efficiency
greyimage = zeros(X, Y);

%Going through each pixel in the image and extracting the RGB values
for i = 1:X
    for j = 1:Y
        red = rgbimage(i, j, 1);
        green = rgbimage(i, j, 2);
        blue = rgbimage(i, j, 3);

        %Calculating the weighted sum formula to each position in the array
        pixelvalue = 0.2126*red + 0.7152*green + 0.0722*blue;

        %Rounding the calculated value to the nearest whole integer
        pixelvalue = round(pixelvalue);

        %Assigning the value in its position in the greyscale image array
        greyimage(i, j) = pixelvalue;

    end 
end

%Converting the data type back to uint8 for storage efficiency
greyimage = uint8(greyimage);