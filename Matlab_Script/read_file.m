function [rotation,traslation,pts]=read_file(num_files)
    rotation=cell(num_files+1,1);
    traslation=cell(num_files+1,1);
    pts=cell(num_files+1,1);
    
    for i=0:num_files
        if i<10
            number=strcat('0',num2str(i));
        else
            number=num2str(i);
        end
        %fprintf('image-%s.dat',number);
        name=sprintf('image-%s.dat',number);

        opts=detectImportOptions(name);
        opts.DataLines=[2 5];
        r=readmatrix(name,opts);

        R=r(1:3,1:3);   %Rotation matrix
        t=r(1:3,4);     %Translation

        opts.DataLines=[8 inf];
        ps=readmatrix(name,opts);


        rotation{i+1}=R;
        traslation{i+1}=t;
        pts{i+1}=ps;
    end
    
end
