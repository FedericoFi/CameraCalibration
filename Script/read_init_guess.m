function [K,distortion]=read_init_guess(name)
    delimiterIn = ' ';
    headerlinesIn = 1;
    A = importdata(name,delimiterIn,headerlinesIn);
    K=A.data;
    %disp(K);
    
    headerlinesIn = 4;
    A = importdata(name,delimiterIn,headerlinesIn);
    distortion=A.data;
    %disp(distortion);
end