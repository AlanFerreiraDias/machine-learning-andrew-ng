function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

%H = theta0*xo + theta1*x1 -> X(m,2) * theta(2,1) -> (m,1) 

h = X*theta;

%J(theta) = 1/2m * sum i=1:m of (htheta(xi) - yi)^2

J = (1/(2*m)) * sum((h-y).^2);

%% =========================================================================


%%========================Another way to do it==============================
%h = zeros(m,1);
%
%for  iter = 1:m
%h(iter,1) = theta' * X(iter,:)';
%end
%
%J =  (1/(2*m)) * sum((h-y).^2);
%
%%==========================================================================

end
