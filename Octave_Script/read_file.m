function [rotation,traslation,pts]=read_file(num_files)
    rotation=cell(num_files+1,1);
    traslation=cell(num_files+1,1);
    pts=cell(num_files+1,1);
    
    
    
    for i=0:num_files
        if i<10
            number=strcat('0',num2str(i));
        else
            number=num2str(i);
        endif
        %fprintf('image-%s.dat',number);
        name=sprintf('image-%s.dat',number);
        
        [t1, t2 ,t3 ,t4] = textread (name, "%f %f %f %f", 4, "headerlines", 1);
        [p1, p2] = textread (name, "%f %f", num_points, "headerlines", 7);
                
        hom=horzcat(t1,t2,t3,t4);
        R=hom(1:3,1:3);   %Rotation matrix
        t=hom(1:3,4);     %Translation
                
        ps=horzcat(p1,p2);
        rotation{i+1}=R;
        traslation{i+1}=t;
        pts{i+1}=ps;
    endfor
    
endfunction