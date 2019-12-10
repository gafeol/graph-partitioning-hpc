function [part1,part2,sep1,sep2] = USIspecpart(A,xy,ignore);
% SPECPART : Spectral partition of a graph.
%
% [part1,part2] = specpart(A) returns a partition of the n vertices
%                 of A into two lists part1 and part2 according to the
%                 spectral bisection algorithm of Simon et al:  
%                 Label the vertices with the components of the Fiedler vector
%                 (the second eigenvector of the Laplacian matrix) and partition
%                 them about the median value.
%
% [part1,part2,sep1,sep2] = specpart(.) also returns the separating edges.
%
% If vertex coordinates are given as a second argument,
% specpart(A,xy) draws a picture of the result.
%
% See also LAPLACIAN, FIEDLER.
%

if nargin < 2
    xy = 0;
end;
picture = 1;


n = size(A,1);
%L = laplacian(A);
u2 = fiedler(A);
map = zeros(n, 1);
for i = 1:length(u2)
   if u2(i) < 0
       map(i) = 0;
   else
       map(i) = 1;
   end
end
 
[part1, part2] = other(map);
% TODO: Return the separating edges
if picture
    clf reset;
    gplotpart(A,xy,part1);
    title('Spectral Partition using the Fiedler Eigenvector');
end
%map = zeros(n,1);
%map(1:round((n/2))) = 0; map((round((n/2))+1):n) = 1;
%[p1,p2] = other(map);
%gplotpart(A,xy,p1);
% <<<<This code is just a dummy implementation to generate a partitioning
