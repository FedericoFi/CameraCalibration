function J=symbolicJac
    syms fx fy u0 v0 k1 k2 p1 p2;
    syms r2;
    syms r11 r12 r13 r21 r22 r23 r31 r32 r33 tx ty tz;
    syms xw yw zw;
    Jx_1=p2*(r2 + (2*(tx + r11*xw + r12*yw + r13*zw)^2)/(tz + r31*xw + r32*yw + r33*zw)^2) + ((k2*r2^2 + k1*r2 + 1)*(tx + r11*xw + r12*yw + r13*zw))/(tz + r31*xw + r32*yw + r33*zw) + (2*p1*(tx + r11*xw + r12*yw + r13*zw)*(ty + r21*xw + r22*yw + r23*zw))/(tz + r31*xw + r32*yw + r33*zw)^2;
    Jx_2=0;
    Jx_3=1;
    Jx_4=0;
    Jx_5=(fx*r2*(tx + r11*xw + r12*yw + r13*zw))/(tz + r31*xw + r32*yw + r33*zw);
    Jx_6=(fx*r2^2*(tx + r11*xw + r12*yw + r13*zw))/(tz + r31*xw + r32*yw + r33*zw);
    Jx_7=(2*fx*(tx + r11*xw + r12*yw + r13*zw)*(ty + r21*xw + r22*yw + r23*zw))/(tz + r31*xw + r32*yw + r33*zw)^2;
    Jx_8=fx*(r2 + (2*(tx + r11*xw + r12*yw + r13*zw)^2)/(tz + r31*xw + r32*yw + r33*zw)^2);

    Jy_1=0;
    Jy_2=p1*(r2 + (2*(ty + r21*xw + r22*yw + r23*zw)^2)/(tz + r31*xw + r32*yw + r33*zw)^2) + ((k2*r2^2 + k1*r2 + 1)*(ty + r21*xw + r22*yw + r23*zw))/(tz + r31*xw + r32*yw + r33*zw) + (2*p2*(tx + r11*xw + r12*yw + r13*zw)*(ty + r21*xw + r22*yw + r23*zw))/(tz + r31*xw + r32*yw + r33*zw)^2;
    Jy_3=0;
    Jy_4=1;
    Jy_5=(fy*r2*(ty + r21*xw + r22*yw + r23*zw))/(tz + r31*xw + r32*yw + r33*zw);
    Jy_6=(fy*r2^2*(ty + r21*xw + r22*yw + r23*zw))/(tz + r31*xw + r32*yw + r33*zw);
    Jy_7=fy*(r2 + (2*(ty + r21*xw + r22*yw + r23*zw)^2)/(tz + r31*xw + r32*yw + r33*zw)^2);
    Jy_8=(2*fy*(tx + r11*xw + r12*yw + r13*zw)*(ty + r21*xw + r22*yw + r23*zw))/(tz + r31*xw + r32*yw + r33*zw)^2;

    J=[Jx_1 Jx_2 Jx_3 Jx_4 Jx_5 Jx_6 Jx_7 Jx_8;
        Jy_1 Jy_2 Jy_3 Jy_4 Jy_5 Jy_6 Jy_7 Jy_8];
    
     assignin('caller','fx',fx);
     assignin('caller','fy',fy);
     assignin('caller','u0',u0);
     assignin('caller','v0',v0);
     assignin('caller','k1',k1);
     assignin('caller','k2',k2);
     assignin('caller','p1',p1);
     assignin('caller','p2',p2);
     assignin('caller','r2',r2);
     
     assignin('caller','r11',r11);
     assignin('caller','r12',r12);
     assignin('caller','r13',r13);
     assignin('caller','r21',r21);
     assignin('caller','r22',r22);
     assignin('caller','r23',r23);
     assignin('caller','r31',r31);
     assignin('caller','r32',r32);
     assignin('caller','r33',r33);
     
     assignin('caller','tx',tx);
     assignin('caller','ty',ty);
     assignin('caller','tz',tz);
     
     assignin('caller','xw',xw);
     assignin('caller','yw',yw);
     assignin('caller','zw',zw);
end