function image =  myResizeBicu(input_image,param)

[~,~,D] = size(input_image);

for i = 1:D
    image(:,:,i) = Bicubic_inter(input_image(:,:,i),param);
end


end
