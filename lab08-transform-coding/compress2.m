%%Compress2 PDF
function [Y,K,L,R] = compress2(X,M)
% Check if the inputs are valid
  if ~isnumeric(X) || ~ismatrix(X)
       error('X must be a numeric matrix');
  end
    if ~isscalar(M) ||~isnumeric(M)||~isreal(M)|| ~isfinite(M)|| M <0|| M > numel(X)||M ~= floor(M)
       error('M must be an integer between 0 and the number of elements in X');% Find the M largest elements by magnitude
    end
  x = X(:);
  [~, order] = sort(abs(x), 'descend');
  % Create the compressed matrix
  selected = sort(order(1:M));
  y = zeros(size(x), 'like', X);
  % Find the row and column indices
   y(selected) = x(selected);
   Y = reshape(y, size(X));
   % Calculate the retained energy ratio
[K,L] = ind2sub(size(X), selected);
 K = K(:);
 L= L(:);
    if sum(abs(x).^2) == 0
        R = 0;
    else
        R = sum(abs(y).^2) / sum(abs(x).^2);
    end
end
