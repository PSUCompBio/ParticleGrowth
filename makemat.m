function makemat=makemat(coordinates)
for a=1:size(coordinates,2); %column 1 to end of coordinates
    first=coordinates(:,a); %this is the first column coordinates, without this line, it threw errors
    count=zeros(length(coordinates),1); %create empty count matrix prior to comparing first with all of second, was overwriting before
    for b=1:size(coordinates,2); %a loop that goes through all the other columns to compare for first
        second=coordinates(:,b); %pull the second column
        if first ~=second %as long as they aren't the same column
            distance=pdist2(first, second, 'euclidean'); %calculates pairwise euclidian distance, result in 3x3, it's broken here
            if distance<=0.03 %if the distance matrix is less than this value anywhere in 3x3
                count=1; %mark count as 1
            else
                count=0; %mark count as zero
            end % end this and go back to the next column in b, repeat, add to count, etc
            sums=sum(count); %sum the count for all of the b column compared with a
            if sums<=5; %if the count is less than 5
                n=5-sums; %number of points generated will make the sum of points in area total 5
                R=[a-.03 a+.03];%setting range for points, within a .03 distance
                added=rand(3,n)*range(R)+min(R); %gives a 3xn matrix of random points within range, this is currently overwriting
            end
        end
    end
end
 

    

              
% added=[1;1;1]
makemat=added