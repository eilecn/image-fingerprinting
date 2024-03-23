function [] = DispFP(fingerprint)
%DispFP is a function that displays the image fingerprint in a pretty
%format on one line in groups of 8

%Input: A 1-by-n logical row vector representing an image fingerprint
%Output: None.

%Calculating the remainder after the fingerprint is sorted into groups of 8
remainder = mod(length(fingerprint), 8);

%Initializing the result as a character vector
result  = '';

%Calculating the number of groups of 8
groups = floor(length(fingerprint)/8);

%Looping to allocate each group
for i = 1:groups

    %Calculating the starting and ending positions of each group of 8
    start = (i - 1)*8 + 1;
    ending = min(i*8, length(fingerprint));

    group = fingerprint(start:ending);

    %Converting to character vector form
    string = char('0' + group);

    %Building the character vector
    result = [result ' ' string];
end

%Adding the remainder incomplete group on at the end
if remainder > 0
    start2 = (8*groups)+1;
    ending2 = start2+remainder-1;

    group2 = fingerprint((start2):ending2);
    string = char('0' + group2);
    result = [result ' ' string];
end

%Removing the extra space at the start
result = strip(result);

%Displaying the result
disp(result);

end