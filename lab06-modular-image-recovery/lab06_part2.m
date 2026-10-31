%% Load the array J
load modball        
%% Display J, properly scaled
%% notes im222 expects input scaled to [0,1], so J must be divided by 255.
figure;
im222(double(J)/255);
title('J as given (wrapped/''solarized'' by the mod-256 shift)');

%% Recover the original image I from J
% explains why mod(J-147,256) works: mod-256 addition is a bijection on 0–255
% so it's fully invertible;flags that line as the key step.
I = mod(J - 147, 256);     

%% Display and visually verify
figure;
im222(double(I)/255);
title('Recovered I = mod(J-147,256)');
% Visual check confirms a sharp photograph is recovered
% (no tearning like in the J display above), which
% confirms the inversion formula is correct.
%% Save the reconstructed image
imwrite(uint8(I), 'recovered_image.png');

