function [diffbits] = HammingDistance(f1, f2)
%HammingDistance is a function that compares two image fingerprints, f1 and
%f2, and determines the number of positions at which the corresponding
%values differ. The number of positions that differ is known as the Hamming
%distance. A small Hamming distance indicates similar images.

%Inputs:
%A 1-by-n logical row vector for fingerprint f1.
%A 1-by-n logical row vector for fingerprint f2.

%Output:
%A integer representing the number of differing bits between fingerprints
%f1 and f2.

%Author: Eileen Qiu

%Initialising the result
diffbits = 0;

%Converting the input into a character vector
f1 = char(double(f1));
f2 = char(double(f2));

%Comparing each value down the array
for i = 1:length(f1)
    result = strcmp(f1(i), f2(i));
    if result == true
        continue
        %Add one to the counter if there is a difference when comparing
    elseif result == false
        diffbits = diffbits + 1;
    end
end


