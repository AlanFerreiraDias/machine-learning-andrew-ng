function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

%Get a subset of X for testing
%X = X(1:5,:)


% Set K
K = size(centroids, 1);
% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
%distance between two points: d^2 = (x1-x2)^2+(y2-y1)^2
diff_vector = zeros(size(X,1),1);
distance_matrix_square = zeros(size(X,1),K);

for i=1:K
    %centroids
    %centroids(i,:)
    diff_vector = X.-centroids(i,:);
    distance_matrix_square(:,i) = diff_vector(:,1).^2 + diff_vector(:,2).^2;
endfor
[min_dist, idx_dist] = min(distance_matrix_square');
idx = idx_dist';
% =============================================================

end

