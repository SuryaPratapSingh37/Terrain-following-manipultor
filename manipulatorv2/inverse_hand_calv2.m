%Calculation
%variable
syms t1 t2 t3 t4 t5 l1 l2 l3 l4 l5 nx ox ax dx ny oy ay dy nz oz az dz c2 s1 s2 c1 c5 

T01=DHTranform(90, 0, l1, 0);
T12=DHTranform(0, l2, 0, t2);
T23=DHTranform(0, l3, 0, t3);
T34=DHTranform(90, 0, 0, t4);
T45=DHTranform(0, 0, 0, t5);
T05=T01*T12*T23;
% T25=T23*T34*T45;
T05=simplify(T05)
T=[
    nx ox ax dx;
    ny oy ay dy;
    nz oz az dz;
    0 0 0 1];
T03=T*(T45^-1)*(T34^-1);
simplify(T03)