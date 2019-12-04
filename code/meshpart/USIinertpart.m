function p = USIinertpart(A,xy,picture);
% INERTPART : Inertial partition of a graph.
%
% p = USIinertpart(A,xy) returns a list of the vertices on one side of a partition
%     obtained by bisection with a line to a moment of inertia
%     of the vertices, considered as points in Euclidean space.
%     Input A is the adjacency matrix of the mesh (used only for the picture!);
%     each row of xy is the coordinates of a point in d-space.
%
% USIinertpart(A,xy,1) also draws a picture.
%

if nargin < 3
    picture = (nargout ==    0);
end;
[n,d] = size(xy);

disp(' ');
disp(' HPC 2018 course:   ');
disp(' Implement your own inertial bisection partitioning  ');
disp(' ');

xm = 0;
ym = 0;
for i = 1:n
   xm = xm + xy(i, 1);
   ym = ym + xy(i, 2);
end
xm = xm/n;
ym = ym/n;
X1 = 0;
X2 = 0;
X3 = 0;
for i = 1:n
    dx = xy(i, 1) - xm;
    dy = xy(i, 2) - ym;
    X1 = X1 + dx*dx;
    X2 = X2 + dx*dy;
    X3 = X3 + dy*dy;
end

[V,D] = eig([X1, X2; X2, X3]);
eigv = V(:,1);

ort = [-eigv(2), eigv(1)];
ort = ort/norm(ort);

p = partition(xy,ort);
gplotpart(A,xy,p);
title('Inertial Partition (dummy)');
disp(' Here we will generate a dummy partitioning ...');
% <<<<This code is just a dummy implementation to generate a partitioning
