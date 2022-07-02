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

  %DIMENSIONS:
  %   theta = (n+1) x 1
  %   X     = m x (n+1)
  %   y     = m x 1
  %   grad  = (n+1) x 1
  %   J     = Scalar

  z   = X * theta;   % m x 1
  h_x = sigmoid(z);  % m x 1

  reg_term = (lambda/(2*m)) * sum(theta(2:end).^2);

  J = (1/m)*sum((-y.*log(h_x))-((1-y).*log(1-h_x))) + reg_term; % scalar

  grad(1) = (1/m) * (X(:,1)'*(h_x-y));                                    % 1 x 1
  grad(2:end) = (1/m) * (X(:,2:end)'*(h_x-y)) + (lambda/m)*theta(2:end);  % n x 1

  % =============================================================

  grad = grad(:);
end
