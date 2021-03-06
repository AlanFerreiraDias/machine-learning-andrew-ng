function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


%J_theta(x) = (1/2m)* sum i=1 to m (H_theta(x)-y)^2 + (lambda/2m) sum j=1 to n Theta_j ^2

 %X -> 12 x 2 (m x n+1)
 %theta -> 2x1 (n+1 x 1)
H_theta = X * theta;
diff_vector = H_theta - y;
%(m x 1)

Regularization = (lambda/(2*m)) * sum(theta(2:end,:).^2);

J = (1/(2*m)) * sum(diff_vector.^2) + Regularization;

%Derivative of J_theta w.r.t = (1/m) * sum i=1:m (h_theta_log - y)*x^i + (lambda/m)*theta_j j from initial_theta+1:n
grad = zeros(size(theta));
grad = (1/m) * X' * diff_vector + (lambda/m)*theta;
grad(1,:) = (1/m) * X(:,1)' * diff_vector;  %overwrites first element

% =========================================================================

grad = grad(:);

end
