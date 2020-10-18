function t = DHTranform(alphai_1, lx, lz, theta)
rx=[1 0 0 0; 0 cosd(alphai_1) -sind(alphai_1) 0; 0 sind(alphai_1) cosd(alphai_1) 0;  0 0 0 1];
tx=[1 0 0 lx; 0 1 0 0; 0 0 1 0; 0 0 0 1];
tz=[1 0 0 0; 0 1 0 0; 0 0 1 lz; 0 0 0 1];
rz=[cosd(theta) -sind(theta) 0 0; sind(theta) cosd(theta) 0 0 ; 0 0 1 0; 0 0 0 1];
t=rz*tz*tx*rx;
end