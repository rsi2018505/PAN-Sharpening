function [ sharpened ] = solve_pansharp( image, pan )

%image = upsample_ms(image);

[~, ~, d_im] = size(image);

sharpened = zeros(size(image));

denom = sum(image, 3);
[r,c,d] =size(denom);
for i=1:r
    for j=1:c
        for k=1:d
            if denom(i,j,k)==0
                denom(i,j,k) = 1;
            end
        end
    end
end

for k = 1 : d_im
    
   sharpened(:,:,k) = ((d_im) * pan .* image(:,:,k) ) ./ denom;
end

end