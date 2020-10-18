%inverse variables
syms nx ox ax dx ny oy ay dy nz oz az dz theta1 theta2 theta3 theata4 theta5 l1 l2 l3 l4 l5
%define unit transformation matrix
T=zeros(4,4);
for i=1:4
    T(i,i)=1;
end

l1=109;l2=100.19; l3=101.4;l4=0;l5=0;
t1=30;t2=5; t3=15; t4=20; t5=30;
T01=DHTranform(90, 0, l1, t1);
T02=T01*DHTranform(0, l2, 0, t2);
T03=T02*DHTranform(0, l3, 0, t3);
T04=T03*DHTranform(90, l4, 0, t4);
T05=T04*DHTranform(0, l5, 0, t5);
T=T05
[nx, ox, ax, dx, ny, oy, ay, dy, nz, oz, az, dz]=extract_value_T(T);
l1=109;l2=100.19; l3=101.4;l4=0;l5=0;
%theta1
theta1=atan2d(dy,dx);

%theta5
theta5= atan2d(-oz,nz);

%theta3
k=(dx^2+dy^2+(dz-l1)^2-l3^2-l2^2)/(2*l2*l3);
theta3=[atan2d(sqrt(1-k^2),k)   atan2d(-sqrt(1-k^2),k)];

%theta2
re1=dx/cosd(theta1);re2=dz-l1; 
k1=[l3*cosd(theta3(1))+l2,l3*cosd(theta3(2))+l2];
k2=[l3*sind(theta3(1)),l3*sind(theta3(2))];
s_2=[(k1(1)*re2-k2(1)*re1)/(k1(1)^2+k2(1)^2),(k1(2)*re2-k2(2)*re1)/(k1(2)^2+k2(2)^2)];
c_2=[(k2(1)*re2+k1(1)*re1)/(k1(1)^2+k2(1)^2),(k2(2)*re2+k1(2)*re1)/(k1(2)^2+k2(2)^2)];
theta2=[atan2d(s_2(1),c_2(1)),atan2d(s_2(2),c_2(2))];
%theta4
theta234p=atan2d(sqrt(ax^2+ay^2), -az);
theta234n=atan2d(-sqrt(ax^2+ay^2), -az);
theta4=[theta234p-theta2(1)-theta3(1), theta234p-theta2(2)-theta3(2), theta234n-theta2(1)-theta3(1),theta234n-theta2(2)-theta3(2)];
solutionp=[theta1,theta2(2), theta3(2),theta4(2) theta5]
t1=solutionp(1);t2=solutionp(2);t3=solutionp(3);t4=solutionp(4);t5=solutionp(5);
% transformation matrices calculation
T01f=DHTranform(90, 0, l1, t1);
T12f=DHTranform(0, l2, 0, t2);
T23f=DHTranform(0, l3, 0, t3);
T34f=DHTranform(90, 0, 0, t4);
T45f=DHTranform(0, 0, 0, t5);
T05f=T01f*T12f*T23f*T34f*T45f
% Tc=[
%     nx ox ax dx;
%     ny oy ay dy;
%     nz oz az dz;
%     0 0 0 1];