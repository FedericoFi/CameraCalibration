function [rotation,traslation,pts]=read_file(num_files)
    rotation=cell(num_files+1,1);
    traslation=cell(num_files+1,1);
    pts=cell(num_files+1,1);
    
    separator = '';
    
    for i=0:num_files
        if i<10
            number=strcat('0',num2str(i));
        else
            number=num2str(i);
        endif
        %fprintf('image-%s.dat',number);
        name=sprintf('image-%s.dat',number);
        
        skipped_rows = 1;
        skipped_columns = 0;
        last_row = 5;
        last_column = 44;
        r = dlmread(name, separator, 
                [skipped_rows, skipped_columns, last_row-1, last_column-1]);
                

        R=r(1:3,1:3);   %Rotation matrix
        t=r(1:3,4);     %Translation

        skipped_rows = 7;
        skipped_columns = 0;
        last_row = 0;
        last_column = 16;
        ps = dlmread(name, separator, 
                [skipped_rows, skipped_columns, Inf, last_column-1]);


        rotation{i+1}=R;
        traslation{i+1}=t;
        pts{i+1}=ps;
    endfor
    
endfunction