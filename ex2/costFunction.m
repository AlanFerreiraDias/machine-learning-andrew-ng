function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta))
%(m,1)

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

%h_theta = g(theta^t * x) --> G = 1/(1+e^-(z))
%J_logistic = sum i from 1:m  - (y)(log(h_theta(x))) - (1-y)(log(1-h_theta(x)))

%X (m,n+1)
%theta (n+1,1)
%y(m,1)

h_theta_lin = X*theta;
%h_theta_lin (m,1)

%prob of each h_theta is y
%h_theta_log = 1/(1+e^(-h_theta_lin));
h_theta_log = sigmoid(h_theta_lin);
%h_theta_log (m,1)

J = -(1/m)* (log(h_theta_log)' * y + log(1-h_theta_log)' * (1-y))

%Derivative of J_theta w.r.t = (1/m) * sum i=1:m (h_theta_log - y)*x^i

diff_matrix = h_theta_log - y
%diff_matrix (m,1)

grad = (1/m) * diff_matrix' * X

% =============================================================

end
