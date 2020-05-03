clear all;
gridfile_name='grid3d.dat';
base_name='image-';

K_init=[224.8 0 95;0 221.6 98;0 0 1];
num_points=36;
num_images=39;


griglia=extract_grid_pts(gridfile_name); 
%griglia(:,3)=0;
%HOMOGENEOUS COORIDNATE OF THE GRID POINTS
griglia(:,4)=1;


[rot_matrices,traslation_vect,points]=read_file(num_images);

fx=K_init(1,1);
fy=K_init(2,2);
u0=K_init(1,3);
v0=K_init(2,3);
k1=0;
k2=0;
p1=0;
p2=0;
distortion = [0;0;0;0];

H=zeros(8,8);
b=zeros(8,1);


for i=0:num_images
    if i<10
        number=strcat('0',num2str(i));
    else
        number=num2str(i);
    end
    fprintf('Process image-%s.dat\n',number);
    
    if i>0
        fx=fx+x(1);
        fy=fy+x(2);
        u0=u0+x(3);
        v0=v0+x(4);
        k1=k1+x(5);
        k2=k2+x(6);
        p1=p1+x(7);
        p2=p2+x(8);
        
        K_init = [fx 0 u0; 0 fy v0;0 0 1];
        distortion = [k1; k2; p1; p2];
        
        H=zeros(8,8);
        b=zeros(8,1);
        disp(K_init);
        disp(distortion');
    end
    
    %====   EXTRACT THE VALUE OF i-th images
    pts=points{i+1};
    R=rot_matrices{i+1};
    t=traslation_vect{i+1};
    
    homTransformMatrix=[R t; 0 0 0 1];
    
    immagine=points{i+1};
    
    for punto=1:num_points
        world_points=griglia(punto,:)';
        
        %========   Compute corrected image points  =========
        vect1=homTransformMatrix*world_points;
        x1=vect1(1)/vect1(3);
        y1=vect1(2)/vect1(3);
        
        r2=x1^2+y1^2;                                       %Compute the radius^2
        
        x2=x1*(1+k1*r2+k2*r2^2)+2*p1*x1*y1+p2*(r2+2*x1^2);
        y2=y1*(1+k1*r2+k2*r2^2)+p1*(r2+2*y1^2)+2*p2*x1*y1;
        
        prediction_u=fx*x2 + u0;
        prediction_v=fy*y2 + v0;
        %===================================================
        
        prediction=[prediction_u;
                    prediction_v];
                
                
        measurement=immagine(punto,:)';
        [e,jac]=error_and_jacobian(prediction,measurement,homTransformMatrix,K_init,world_points,r2,distortion);
        
        H=H+jac'*jac;
        b=b+jac'*e;
    end
   x=H\-b;
   disp(x);
end

fx=fx+x(1);
fy=fy+x(2);
u0=u0+x(3);
v0=v0+x(4);
k1=k1+x(5);
k2=k2+x(6);
p1=p1+x(7);
p2=p2+x(8);

K_init = [fx 0 u0; 0 fy v0;0 0 1];
distortion = [k1; k2; p1; p2];
disp("Parameter Estimation complete");
disp(K_init);
disp(distortion');
