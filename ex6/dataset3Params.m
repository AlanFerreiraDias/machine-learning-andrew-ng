function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

x1 = Xval(:,1);
x2 = Xval(:,2);

indexC = 1;
indexSig = 1;
indexAux = 1;

c = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigAux = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

error_matrix = zeros(size(c,2),3);

for c = c
    for sig = sigAux
        C = c;
        sigma = sig;
        model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
        predictions = svmPredict(model, Xval);
        error_matrix(indexAux,:) = [c; sig; mean(double(predictions ~= yval))];
        indexSig = indexSig + 1;
        indexAux = indexAux + 1;
    endfor
    indexSig = 1;
    indexC = indexC + 1;
endfor 

[min_error, min_index] = min(error_matrix(:,3))
chosenParams = error_matrix(min_index,:)

C = chosenParams(1,1);
sigma = chosenParams(1,2);

% =========================================================================

end
