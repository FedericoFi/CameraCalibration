function [error,j1]=error_and_jacobian(prediction,measurement,hom,initial_guess,world_pts,radius,distortion,J)
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

    error=prediction-measurement;
    j1=eval(J);
    
endfunction