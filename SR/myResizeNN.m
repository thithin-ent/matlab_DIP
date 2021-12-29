function image =  myResizeNN(input_image,param)

[r,c,~] = size(input_image);

for i = 1:round(r*param)
    for j = 1:round(c*param)
        image(i,j,:) = uint8(input_image(round((i-1)/param+0.5),round((j-1)/param+0.5),:));
    end
end

end