function image =  myResizeBil(input_image,param)
[r,c,D] = size(input_image);

R = r*param;
C = c*param;

[Cf_out, Rf_out] = meshgrid(1 : C, 1 : R);

Rf_out = Rf_out/param+0.5*(1-1/param);
Cf_out = Cf_out/param+0.5*(1-1/param);


Rf = floor(Rf_out);
Cf = floor(Cf_out);

Rf(Rf == 0) = 1;
Cf(Cf == 0) = 1;


Rf(Rf == r) = r-1;
Cf(Cf == c) = c-1;

dr = Rf_out-Rf;
dc = Cf_out-Cf;

RC_11 = sub2ind([r, c], Rf, Cf);
RC_21 = sub2ind([r, c], Rf+1,Cf);
RC_12 = sub2ind([r, c], Rf,Cf+1);
RC_22 = sub2ind([r, c], Rf+1, Cf+1);

image = zeros(R, C, D);

for i = 1 : D
    img = double(input_image(:,:,i)); 

    tmp = img(RC_11).*(1 - dr).*(1 - dc) + ...
        img(RC_21).*(dr).*(1 - dc) + ...
        img(RC_12).*(1 - dr).*(dc) + ...
        img(RC_22).*(dr).*(dc);
    image(:,:,i) = tmp;
end
image = uint8(image);

end