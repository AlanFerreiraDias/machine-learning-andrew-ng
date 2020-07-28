function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%

%h_theta = g(theta^t * x) --> G = 1/(1+e^-(z))
%J_logistic_reg = sum i from 1:m  - (y)(log(h_theta(x))) - (1-y)(log(1-h_theta(x))) + (lambda/2m)* sum j from 1:n theta_j^2

%X (m,n+1)
%theta (n+1,1)
%y(m,1)

h_theta_lin = X*theta;
%h_theta_lin (m,1)

%prob of each h_theta is y
%h_theta_log = 1/(1+e^(-h_theta_lin));
h_theta_log = sigmoid(h_theta_lin);
%h_theta_log (m,1)

J = -(1/m)* (log(h_theta_log)' * y + log(1-h_theta_log)' * (1-y)) + (lambda/(2*m))*sum(theta([2:size(theta,1),:]).^2);


%diff_matrix (m,1)
diff_matrix = h_theta_log - y;

%Derivative of J_theta w.r.t = (1/m) * sum i=1:m (h_theta_log - y)*x^i + (lambda/m)*theta_j j from initial_theta+1:n
grad = zeros(size(theta));
grad = (1/m) * X' * diff_matrix + (lambda/m)*theta;
grad(1,:) = (1/m) * X(:,1)' * diff_matrix;  %overwrites first element










% =============================================================

grad = grad(:);

end