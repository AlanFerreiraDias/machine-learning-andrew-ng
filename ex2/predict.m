function p = predict(theta, X)
%PREDICT Predict whether the label is 0 or 1 using learned logistic 
%regression parameters theta
%   p = PREDICT(theta, X) computes the predictions for X using a 
%   threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)

m = size(X, 1); % Number of training examples

% You need to return the following variables correctly
p = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters. 
%               You should set p to a vector of 0's and 1's
%


%theta (n+1,1)  
%X (m,n+1)

h_theta_lin = X*theta;
%h_theta_lin (m,1)

%prob of each h_theta is y
h_theta_log = sigmoid(h_theta_lin);

p = arrayfun(@preditOneOrZero, h_theta_log);

% =========================================================================

end

function pred = preditOneOrZero(x)
    if x>=0.5 
        pred = 1; 
    else 
        pred = 0;
    endif
end