%% Load Data
%Loading the hidden message for processing
clear;
clc;
close all;
load('hiddenmsg.mat');
C =double(hiddenmsg);
N=size(C, 1);
%% Iterative Haar Transform
%Applying the haar transform in 4 stages
for k= 1:4
    n = N / 2^(k-1);
    P= iterate_haar(n);
    C(1:n,1:n) = P *C(1:n, 1:n)*P';
    figure;
    imshow(C, []);
    title(['Haar Transform Stage ',num2str(k)]);
end
%% Determine L
% Examining the results of the iterative Haar wavelet transform.
% Viewing the top left block of the transformed matrix.
%At the fourth stage, the block is close to being uniform.
% This is the separation between the message and noise component.
% Since the image has 10 wavelet scales, and four stages are applied to it.
% the resulting separation level is L = 10 - 4 = 6.
% Therefore, the determined value of L is 6.
L = 6;
disp(['L = ', num2str(L)]);
%% Remove Noise Coefficients
% Removing the noise coefficients while keeping the message information.
n = N / 2^(10-L);
Cclean = zeros(size(C));
Cclean(1:n, 1:n) = C(1:n, 1:n);
%% Inverse Haar Transform
% Reversing the Haar transform to reconstruct the original image.
for k = 4:-1:1
    n = N / 2^(k-1);
    P = iterate_haar(n);
    Cclean(1:n, 1:n) = P'*Cclean(1:n, 1:n) * P;
end
%% Display Recovered Message
%Displaying the recovered image after the transformation
figure;
imshow(-Cclean, [])
title(['Recovered Message, L = ',num2str(L)]);
