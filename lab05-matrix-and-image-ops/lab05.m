%%Section 1:
A = 1:20;
A = reshape(A,4,5)
A([1 2], [3 4 5])
A(1:3, 4:-1:2)
A(:, 3)
A(:, [3,3])
p = [2 3 5 4 1];
A(:,p)
%A(p,:) this shows error that why commented
Q=[2 3 4 1]
A(Q,:)
%% Section 2:
B = reshape(1:9,3,3)
B*B
B.*B
B*B == B.*B
c = 5;
c*B
c+B
%% Section 3
U = ones(3,3)
Z = zeros(3,3)
5.^Z - U
R = rand(size(U))
2*R-1
R == R.'
ans - eye(3)
v = diag(R)
diag(v)
%% Section 4
m = 100;
U = ones(m,m);
figure;imshow(U)
H = 0.5*U;figure; imshow(H)
Z= 0*U;figure; imshow(Z)
E = eye(m);figure; imshow(E)
figure;imshow(0.5*E + 0.5*U)
R = rand(m,m);figure; imshow(R)
figure;imshow(0.5*E + 0.5*R)
%% Section 5
m = 200;
a = 0 : 1/m : 1;
u = ones(size(a));
X = u.'*a;
Y = a.'*u;
figure;imshow(X)
figure;imshow(Y)
figure;imshow(X>Y)
figure;imshow(X.^2<Y)
C = (cos((X+Y-1)*pi/2)).^6;
figure;imshow(C)
F = a.'*a;
figure;imshow((1-F).^6)

%% Section 6: Image transformations
A = imread('cameraman.tif');
disp(size(A))
figure
figure;subplot(2,1,1),figure; imshow(A)
A1 = A(30:95, 85:150);
figure;subplot(2,1,2),figure; imshow(A1)
A2 = rot90(A,1);
figure;imshow(A2)
figure;imshow(fliplr(A))
figure;imshow(flipud(A)) 
figure;imshow(A.')
A3 = circshift(A,128);
figure;imshow(A3)
A4 = (circshift(A3.',128)).';
figure;imshow(A4)
A5 = A>120;
figure;imshow(A5)
A6 = double(A).^0.8;
figure;imshow(uint8(A6))
A7 = double(A).^1.05;
figure;imshow(uint8(A7))
%% Challenge
A = imread('cameraman.tif');
B = A(206:345, 377:466);% 1. zoom in (MATLAB indexes from 1)
B = flipud(B);    % 2. upside-down flip
B = double(B);% 3. convert to double
B = uint8(255*(B/255).^1.05);% 4. gamma adjustment
B = imresize(B, [135 83]);% 5. resize to the challenge 
figure;imshow(B)