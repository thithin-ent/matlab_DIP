function output_image = myHisteq(input_image,L)

R = size(input_image,1);
C = size(input_image,2);

histo = zeros(1,L);

for i = 1:R
    for j = 1:C
    value = input_image(i,j);
    histo(value+1) = histo(value+1)+1;
    end
end

histo  = histo/(R*C);

for i = 1:length(histo)
hito_intg(i) = round((L-1)*sum(histo(1:i)));
end

output_image = uint8(zeros(R,C));
for i = 1:R
    for j = 1:C
    output_image(i,j) = hito_intg(input_image(i,j)+1);
    end
end

end