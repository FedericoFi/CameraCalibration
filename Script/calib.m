clear all;
gridfile_name='grid3d.dat';
base_name='image-';

K_init=[224.8 0 95;0 221.6 98;0 0 1];
num_points=36;
num_images=0;
rows= 640;
cols= 480;


griglia=extract_grid_pts(gridfile_name); %LETTURA GRIGLIA

%HOMOGENEOUS COORIDNATE OF THE GRID POINTS
%griglia(:,4)=1;

[rot_matrices,traslation_vect,points,Npoints]=read_file(num_images,rows,cols);
