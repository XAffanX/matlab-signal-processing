%% Initialize and Define Test Matrix
clear; clc; close all;
% Test matrix and number of elements to keep
x = [-1 3 4 7; 8 -2 1 1; 0 -13 1 4]
% Find the M largest values by magnitude
M = 5
%% Find the Largest Elements
xvec = x(:)
% Set the remaining values to zero and reshape the matrix
[~, order] = sort(abs(xvec), 'descend')
selected = sort(order(1:M))
%% Find the row and column positions of selected values
yvec = zeros(size(xvec))
yvec(selected) = xvec(selected)
%% Find Indices and Calculate Energy
y = reshape(yvec, size(x));
% Calculate the energy ratio after compression
[K, L] = ind2sub(size(x), selected);
K =K(:)
L =L(:)
if sum(abs(xvec).^2) == 0
    r = 0
else
    r = sum(abs(yvec).^2) / sum(abs(xvec).^2)
end
%% Display Results and Verify Function
disp('Original matrix:')
disp(x)
% Compare the results with the compress2 function
disp('Compressed matrix:')
disp(y)
disp('Selected positions [K L]:')
%% Plot Original and Compressed Matrices
disp([K L])
fprintf('Energy ratio: %.6f\n',r)
[Y2, K2, L2, R2] = compress2(x, M)
assert(isequal(y, Y2) && isequal(K, K2) && isequal(L, L2) && abs(r-R2) < 1e-12);
% Compareing the original and compressed matrices visually
figure
subplot(1,2,1)
imagesc(x); axis image; colorbar;
title('Original Matrix')
xlabel('Column'); ylabel('Row');
subplot(1,2,2)
imagesc(y); axis image; colorbar;
title('Compressed Matrix')
xlabel('Column'); ylabel('Row');
