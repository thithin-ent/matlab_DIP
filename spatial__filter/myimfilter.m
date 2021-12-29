function out_image = myimfilter(input_image,K)
[r,c] = size(input_image);
[rK,cK] = size(K);
temp_image = zeros(r+rK-1,c+cK-1); 
out_image = zeros(r,c);

temp_image(floor(rK/2)+1:floor(rK/2)+r,floor(cK/2)+1:floor(cK/2)+c) = input_image;

for i = 1:r
   for j = 1:c
      temp = temp_image(i:i+rK-1,j:j+cK-1).*K;
      out_image(i,j) = sum(temp(:));
   end
end

out_image = uint8(out_image);
end