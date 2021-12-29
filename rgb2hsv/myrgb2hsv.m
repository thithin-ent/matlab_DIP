function [H,S,V] = myrgb2hsv(input_image)
R = double(input_image(:,:,1));
G = double(input_image(:,:,2));
B = double(input_image(:,:,3));
th = acos(  ((R-G)+(R-B))./sqrt((R-G).^2+(R-B).*(G-B))./2  );
th(isnan(th)) = 0;
H = zeros(size(th));
H(B<=G) = th(B<=G);
H(B>G) = 2*pi-th(B>G);
H = H/(2*pi);
S = 1-3./(R+G+B).*min(double(input_image),[],3);
V = (R+G+B)/3/255;
end