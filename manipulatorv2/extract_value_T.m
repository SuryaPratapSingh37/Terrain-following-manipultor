function [nx, ox, ax, dx, ny, oy, ay, dy, nz, oz, az, dz]= extract_value_T(T)
nx=T(1,1);ny=T(2,1);nz=T(3,1);ox=T(1,2);oy=T(2,2);oz=T(3,2);ax=T(1,3);ay=T(2,3);az=T(3,3);dx=T(1,4);dy=T(2,4);dz=T(3,4);
end