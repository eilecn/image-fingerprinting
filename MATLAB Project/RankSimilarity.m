function [] = RankSimilarity(fingerprint, filenames, collection, n)
%RankSimilarity is a function that displays n image files ranked by
%descending similarity (i.e., the image most similar to the search image
%will be at the top of the list).

%Inputs:
%A 1-by-64 logical row vector representing the image fingerprint to search.
%An m-by-1 string array representing a list of image file names.
%An m-by-1 cell array containing a collection of image fingerprints.
%An integer n denoting how many image fingerprint matches to display.

%Output:
%None.

%Author: Eileen Qiu

%Initialise array to store HammingDistance values and rank r
distances = zeros(length(filenames), 2);

%Calculating the hamming distances comparing the search image with each
%image and storing them in the array
for i = 1:length(filenames)
    distance = HammingDistance(fingerprint, collection{i});
    distances(i, 1) = i;
    distances(i, 2) = distance;
end

%Sorting the array in ascending order
distances = sortrows(distances, 2);

%Formatting and displaying the result
if n < 10
    for i = 1:n
        r = i;
        distance = distances(i, 2);
        index = distances(i, 1);
        filename = filenames(index);

        if distance > 9
            fprintf('%d. %d - %s\n', r, distance, filename);
        elseif distance < 10
            fprintf('%d.  %d - %s\n', r, distance, filename);
        end

    end
end

if n > 9
    for i = 1:n
        r = i;
        distance = distances(i, 2);
        index = distances(i, 1);
        filename = filenames(index);

        if (distance > 9) && (i < 10)
            fprintf(' %d. %d - %s\n', r, distance, filename);
        elseif (distance > 9) && (i > 9)
            fprintf('%d. %d - %s\n', r, distance, filename);
        elseif (distance < 10) && (i < 10)
            fprintf(' %d.  %d - %s\n', r, distance, filename);
        elseif (distance < 10) && (i > 9)
            fprintf('%d.  %d - %s\n', r, distance, filename);
        end

    end
end