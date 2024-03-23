function [fingerprint] = ImageFingerprint(img, charhash, chartype)
%ImageFingerprint is a function that creates a 64 bit image fingerprint
%using the specified hashing and resizing algorithm for a given colour
%image.

%Input:
%An m-by-n-by-3 uint8 array representing a colour image.
%A character vector containing either 'AvgHash' or 'DiffHash'.
%A character vector containing either 'Nearest' or 'Box'.

%Output:
%A 1-by-64 logical row vector representing the image fingerprint.

%Author: Eileen Qiu

%Running the GreyscaleLuma function to turn the image into a greyscale
%image:
img = GreyscaleLuma(img);

%Resizing the image with the ResizeNearest or ResizeBox functions depending
%on the input:
if (strcmp(charhash, 'AvgHash') == true) && (strcmp(chartype, 'Nearest') == true)
    img = ResizeNearest(img, [8, 8]);
elseif (strcmp(charhash, 'DiffHash') == true) && (strcmp(chartype, 'Nearest') == true)
    img = ResizeNearest(img, [8, 9]);
elseif (strcmp(charhash, 'AvgHash') == true) && (strcmp(chartype, 'Box') == true)
    img = ResizeBox(img, [8, 8]);
elseif (strcmp(charhash, 'DiffHash') == true) && (strcmp(chartype, 'Box') == true)
    img = ResizeBox(img, [8, 9]);
end

%Applying the AvgHash or DiffHash functions:
if (strcmp(charhash, 'AvgHash') == true)
    img = AvgHash(img);
elseif (strcmp(charhash, 'DiffHash') == true)
    img = DiffHash(img);
end

fingerprint = img;

end