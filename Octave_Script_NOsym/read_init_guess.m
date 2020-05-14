function [K,distortion]=read_init_guess(name)
    [t1, t2 ,t3] = textread (name, "%f %f %f", 3, "headerlines", 1);
    K=horzcat(t1,t2,t3);
    
    [d1, d2 ,d3, d4] = textread(name, 'Distorsion coefficients (k1,k2,p1,p2) : %f %f %f %f', 1, "headerlines", 4);
    distortion=horzcat(d1,d2,d3,d4);
endfunction