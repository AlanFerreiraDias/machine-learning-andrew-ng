function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

fprintf('Starting Gradient Descent\n');



for iter = 1:num_iters
% ====================== YOUR CODE HERE ======================
% Instructions: Perform a single gradient step on the parameter vector
%               theta. 
%
% Hint: While debugging, it can be useful to print out the values
%       of the cost function (computeCost) and gradient here.
%
% ============================================================
    h = X * theta;
    dif_vector = h - y;
    sigma = (1/m) * X' * dif_vector;
    theta = theta - alpha * sigma;

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end 

end
