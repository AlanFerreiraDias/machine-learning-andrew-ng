function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

%includes bias row
A1 = [ones(m,1) X]; %(m x n+1)

% Theta1 (25 x 401) --> (S2 x n+1)
% Theta2 (10 x 26) --> (S3 x S2 + 1)

%First Layer
activationHiddenLayer = sigmoid(A1 * Theta1');
%activationHiddenLayer (m x S2);

%Adds bias 
activationHiddenLayer = [ones(m,1) activationHiddenLayer];

%Second Layer
[h_x, p] = max(sigmoid(activationHiddenLayer * Theta2'),[],2);


% =========================================================================


end
