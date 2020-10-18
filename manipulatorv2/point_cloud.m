% innitialise necessary variables:
l1=0;l2=0; l3=0;l4=0;l5=0;%assumed in mm
t1=0;t2=0; t3=0; t4=0; t5=0;%assumed in degree
w=10;
hold on 
grid on
%manipulator diagram
%defining variable values
l1=109;l2=100.19; l3=101.4;l4=90.03;l5=99.5;%assumed in mm
%position
t1=0;t2=-45; t3=-45; t4=0; t5=0;
%base coordinates
o0=[0;0;0];
%setting up display view
hold on 
grid on
axis([-5 150 -20 20 -300 150])
v = [0.1 -1 0.3];
[caz,cel] = view(v);
%transformation matrices calculation
T01=DHTranform(90, 0, l1, t1);
T02=T01*DHTranform(0, l2, 0, t2);
T03=T02*DHTranform(0, l3, 0, t3);
T04=T03*DHTranform(90, l4, 0, t4);
T05=T04*DHTranform(0, l5, 0, t5);
%plane points
p1=T05*[0;-w;-w;1];p2=T05*[0;w;-w;1]; p3=T05*[0;w;w;1];p4=T05*[0;-w;w;1];
%defuault position display
hold on 
grid on
h1=line([o0(1,1), T01(1,4)],[o0(2,1), T01(2,4)],[o0(3,1), T01(3,4)],'Color', 'red', 'LineWidth',3)
h2=line([T01(1,4),T02(1,4)],[T01(2,4),T02(2,4)],[T01(3,4),T02(3,4)],'Color', 'green','LineWidth',2.5)
h3=line([T02(1,4),T03(1,4)],[T02(2,4),T03(2,4)],[T02(3,4),T03(3,4)],'Color', 'blue','LineWidth',2)
h4=line([T03(1,4),T04(1,4)],[T03(2,4),T04(2,4)],[T03(3,4),T04(3,4)],'Color', 'yellow','LineWidth',1.5)
h5=line([T04(1,4),T05(1,4)],[T04(2,4),T05(2,4)],[T04(3,4),T05(3,4)],'Color', 'black','LineWidth',1)
tic
for i=40:50
    tic
    for j=40:50
        tic
        for k=-10:1:10
            for l=-10:1:10
                t2=-i;t3=-j;t4=k;t5=l;
                T01=DHTranform(90, 0, l1, t1);
                T02=T01*DHTranform(0, l2, 0, t2);
                T03=T02*DHTranform(0, l3, 0, t3);
                T04=T03*DHTranform(90, l4, 0, t4);
                T05=T04*DHTranform(0, l5, 0, t5);
                plot3(T05(1,4),T05(2,4),T05(3,4),'.', 'Color', 'r')
            end
        end
        toc
    end
    toc
end
toc
