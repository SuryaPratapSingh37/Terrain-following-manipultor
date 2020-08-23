clear
clc
syms x y z t tp 
dist=-1;
%center of ultrasonic sensor
midp=[0 4 0];
%direction of wave propagation
perpv=[1 -1 0];
%line in direction of wave propagation
wave_dir=midp+perpv*tp;
%definig equations for point calculation
x=wave_dir(1);
y=wave_dir(2);
z=wave_dir(3);
%equation for surface(used a parabolic surface)
eq=z^2-x;
t=solve(eq)
%%%%%%%evaluate answer%%%%%%%%%%%
%%check if e have a solution or not
if t==false
    fprintf("no solution available")
    return
end
sizet=size(t);
%find out how many solitios need to ge checked
rows=sizet(1);
sol=zeros(rows,3);
%loop to check direction and distance of the solution point from sensor
for i=1:rows
    i
    sol(i,:)=midp+perpv*t(i);%%%sol no of solution(rows) vs [x y z] ie solo (no of solutions)x 3
    wavedirection_v=sol(i,:)-midp;
    check_dot=dot(wavedirection_v,perpv)
    if(check_dot>0)%dot product with waved direction vctor should be positive
        check_dist=norm(wavedirection_v);%minimum distance has to be chosen
        if(dist<0)
            dist=check_dist;
            f=i;
        elseif(dist>check_dist)
            dist=check_dist;
            f=i;
        end
    end
end
%print final distance
dist
%print intesection point 
sol(f,:)
%dislplay of the above in the form of figure
grid on
hold on
plot3(sol(f,1),sol(f,2),sol(f,3),'o')
tp=5;wave_dir=midp+perpv*tp;
p1=wave_dir;
tp=-5;wave_dir=midp+perpv*tp;
p2=wave_dir;
plot3(0 ,4, 0,'o','Color','r')
line([p1(1),p2(1)],[p1(2),p2(2)],[p1(3),p2(3)]);
xs=@(s) s;
ys=@(s) s^2;
zs=@(s)0;
fplot3(xs,ys,zs)
