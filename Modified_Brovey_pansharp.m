function [ sharpened ] = solve_pansharp( image, pan )

I = image(:,:,1)*1/3 + image(:,:,2)*1/3 + image(:,:,3)*1/3;

P = (pan - mean(pan(:))) * std(I(:))/std(pan(:)) + mean(I(:));

sharpened  = zeros(size(image));

% for n=1:3
%     sharpened(:,:,n)= image(:,:,n) + P - I;
% end
k = 0.1;
for n=1:3
    sharpened (:,:,n)= (pan.*(image(:,:,n) + k.*(pan - I)))./(I+k.*(pan-I));
end
end

