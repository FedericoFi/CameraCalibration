function [error,j1]=error_and_jacobian(prediction,measurement,hom,initial_guess,world_pts,radius,distortion)
    xw=world_pts(1);
    yw=world_pts(2);
    zw=world_pts(3);
    
    tx=hom(1,4);
    ty=hom(2,4);
    tz=hom(3,4);
    
    r11=hom(1,1);
    r12=hom(1,2);
    r13=hom(1,3);
    r21=hom(2,1);
    r22=hom(2,2);
    r23=hom(2,3);
    r31=hom(3,1);
    r32=hom(3,2);
    r33=hom(3,3);
    
    fx=initial_guess(1,1);
    fy=initial_guess(2,2);
    u0=initial_guess(1,3);
    v0=initial_guess(2,3);
    k1=distortion(1);
    k2=distortion(2);
    p1=distortion(3);
    p2=distortion(4);
    
    
    r2=radius;
    
    
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

    j1=[Jx_1 Jx_2 Jx_3 Jx_4 Jx_5 Jx_6 Jx_7 Jx_8;
        Jy_1 Jy_2 Jy_3 Jy_4 Jy_5 Jy_6 Jy_7 Jy_8];

    error=prediction-measurement;
endfunction