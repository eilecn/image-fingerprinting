function [fingerprint] = FingerprintCollection(string, charhash, chartype)
%FingerprintCollection is a function that stores all of the image
%fingerprints from a list of image filenames so they can be quickly looked
%up for comparison.

%Inputs:
%A m-by-1 string array representing a list of image file names.
%A character vector containing either 'AvgHash' or 'DiffHash'.
%A character vector containing either 'Nearest' or 'Box'.

%Output:
%An m-by-1 cell array containg the fingerprint from each image file

%Author: Eileen Qiu

%Allocating fingerprint values inside the cell array
for i = 1:length(string)
    file = imread(string(i));
    fingerprint{i} = ImageFingerprint(file, charhash, chartype);
end

%Transposing the array
fingerprint = fingerprint';

end
