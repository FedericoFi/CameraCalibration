clear;
pkg load symbolic;
gridfile_name='grid3d.dat';
initial_guess_name='camera_param_initial_guess.dat';
base_name='image-';


num_points=36;
num_images=39;

[K_init,distortion]=read_init_guess(initial_guess_name);

griglia=dlmread(gridfile_name);

%HOMOGENEOUS COORIDNATE OF THE GRID POINTS
griglia(:,4)=1;


[rot_matrices,traslation_vect,points]=read_file(num_images,num_points);


fxr=K_init(1,1);
fyr=K_init(2,2);
u0r=K_init(1,3);
v0r=K_init(2,3);
k1r=distortion(1);
k2r=distortion(2);
p1r=distortion(3);
p2r=distortion(4);

H=zeros(8,8);
b=zeros(8,1);




deltaX=zeros(8,num_images);
iterations=zeros(1,num_images);

J=symbolicJac();


for i=0:num_images
    if i<10
        number=strcat('0',num2str(i));
    else
        number=num2str(i);
    endif
    fprintf('Process image-%s.dat\n',number);
    
    %====   EXTRACT THE VALUE OF i-th images
    R=rot_matrices{i+1};
    t=traslation_vect{i+1};
    
    homTransformMatrix=[R t; 0 0 0 1];
    
    immagine=points{i+1};
    
    for punto=1:num_points
        world_points=griglia(punto,:)';
        
        
        %========   Compute corrected image points  =========
        vect1=homTransformMatrix*world_points;
        x1r=vect1(1)/vect1(3);
        y1r=vect1(2)/vect1(3);
        
        r2r=x1r^2+y1r^2;                                       %Compute the radius^2
        
        x2r=x1r*(1+k1r*r2r+k2r*r2r^2)+2*p1r*x1r*y1r+p2r*(r2r+2*x1r^2);
        y2r=y1r*(1+k1r*r2r+k2r*r2r^2)+p1r*(r2r+2*y1r^2)+2*p2r*x1r*y1r;
        
        prediction_u=fxr*x2r + u0r;
        prediction_v=fyr*y2r + v0r;
        %===================================================
        
        prediction=[prediction_u;
                    prediction_v];
                
                
        measurement=immagine(punto,:)';
        [e,jac]=error_and_jacobian(prediction,measurement,homTransformMatrix,K_init,world_points,r2r,distortion,J);
        
        H=H+jac'*jac;
        b=b+jac'*e;
    endfor
   x=H\-b;
   %disp(x);
   
   deltaX(:,i+1)=x;
   iterations(i+1)= i+1;
   
   fxr=fxr+x(1);
   fyr=fyr+x(2);
   u0r=u0r+x(3);
   v0r=v0r+x(4);
   k1r=k1r+x(5);
   k2r=k2r+x(6);
   p1r=p1r+x(7);
   p2r=p2r+x(8);

   K_init = [fxr 0 u0r; 0 fyr v0r;0 0 1];
   distortion = [k1r; k2r; p1r; p2r];

   H=zeros(8,8);
   b=zeros(8,1);
endfor
plotta(deltaX,iterations);

K_init = [fxr 0 u0r; 0 fyr v0r;0 0 1];
distortion = [k1r; k2r; p1r; p2r];
disp("Parameter Estimation complete");
disp(K_init);
disp(distortion');
disp("Press any to close");
pause;
