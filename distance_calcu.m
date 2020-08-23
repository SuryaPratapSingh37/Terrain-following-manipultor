clear
clc
syms x y z t tp 
flag=0;
c=0;
dist=-1;
midp=[0 4 0];
perpv=[1 -1 0];
wave_dir=midp+perpv*tp;
x=wave_dir(1);
y=wave_dir(2);
z=wave_dir(3);
eq=x^2-y;
t=solve(eq);
%%%%%%%evaluate answer%%%%%%%%%%%
sizet=size(t);
rows=sizet(1);
sol=zeros(rows,3);
for i=1:rows
    i
    sol(i,:)=midp+perpv*t(i);%%%sol no of solution(rows) vs [x y z] ie solo (no of solutions)x 3
    wavedirection_v=sol(i,:)-midp;
    check_dot=dot(wavedirection_v,perpv)
    if(check_dot>0)
        check_dist=norm(wavedirection_v);
        if(dist<0)
            dist=check_dist;
            f=i;
        elseif(dist>check_dist)
            dist=check_dist;
            f=i;
        end
    end
end
dist
sol(f,:)
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


