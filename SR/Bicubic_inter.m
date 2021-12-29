function image =  Bicubic_inter(input_image,param)

input_image = double(input_image);

[r,c] = size(input_image);

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

f_11 = sub2ind([r, c], Rf, Cf);
f_21 = sub2ind([r, c], Rf+1,Cf);
f_12 = sub2ind([r, c], Rf,Cf+1);
f_22 = sub2ind([r, c], Rf+1, Cf+1);

I = padarray(input_image,[1 1],'replicate','both');

for i = 1:r+2
    for j = 1:c
        dxII(i,j) = (double(I(i,j+2)) - double(I(i,j)))/2;
    end
end
dxI = dxII(2:r+1,:);

for i = 1:r
    for j = 1:c+2
        dyII(i,j) = (double(I(i+2,j)) - double(I(i,j)))/2;
    end
end
dyI = dyII(:,2:c+1);

for i = 1:r
    for j = 1:c
        dxyI(i,j) = (double(dxII(i+2,j)) - double(dxII(i,j)))/2;
    end
end
F1 = [1,0,0,0;...
    0,0,1,0;...
    -3,3,-2,-1;...
    2,-2,1,1];

F2 = [1,0,-3,2;...
    0,0,3,-2;...
    0,1,-2,1;...
    0,0,-1,1];

for i = 1:R
    for j = 1:C
        F = [input_image(f_11(i,j)),input_image(f_12(i,j)),dxI(f_11(i,j)),dxI(f_12(i,j)); ...
             input_image(f_21(i,j)),input_image(f_22(i,j)),dxI(f_21(i,j)),dxI(f_22(i,j)); ...
             dyI(f_11(i,j)),dyI(f_12(i,j)),dxyI(f_11(i,j)),dxyI(f_12(i,j)); ...
             dyI(f_21(i,j)),dyI(f_22(i,j)),dxyI(f_21(i,j)),dxyI(f_22(i,j));];
         
        A = F1*F*F2;
        X = [1 dr(i,j) dr(i,j)^2 dr(i,j)^3];
        Y = [1;dc(i,j);dc(i,j)^2;dc(i,j)^3];
        
        image(i,j) = X*A*Y;
    end
end
image = uint8(image);

end