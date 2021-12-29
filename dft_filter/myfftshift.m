function out_F = myfftshift(F)
    [r,c] = size(F);
    out_F = zeros(r,c);
    for i = 0:r-1
        for j = 0:c-1
        x = rem(round(r/2)+i,r)+1;
        y = rem(round(c/2)+j,c)+1;
        out_F(i+1,j+1) = F(x,y); 
        end
    end
end