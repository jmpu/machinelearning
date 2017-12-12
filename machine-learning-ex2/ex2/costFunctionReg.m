function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
K = 0;
R = zeros(1,3);
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

for i=1:m
    J=J+(-y(i,:)*log(sigmoid(X(i,:)*theta))-(1-y(i,:))*log(1-sigmoid(X(i,:)*theta)));
end
for j=2:3
    K=K+theta(j,:)^2;
end
J=J/m+lambda*K/(2*m);

for j=1:m
    R=X(j,:);
grad(1,:)=grad(1,:)+(sigmoid(X(j,:)*theta)-y(j,:))*R(:,1);
end
grad(1,:)=grad(1,:)/m;

for i=2:3
    for j=1:m
        R=X(j,:);
        grad(i,:)=grad(i,:)+(sigmoid(X(j,:)*theta)-y(j,:))*R(:,i);
    end
    grad(i,:)=grad(i,:)/m+lambda*theta(i,:)/m;
end

% =============================================================

end
