function [K,distortion]=read_init_guess(name)
    separator = '';
    skipped_rows = 1;
    skipped_columns = 0;
    last_row = 4;
    last_column = 18;
    K = dlmread(name, separator, 
            [skipped_rows, skipped_columns, last_row-1, last_column-1]);
            
    separator = '';
    skipped_rows = 4;
    skipped_columns = 4;
    last_row = 5;
    last_column = 9;
    distortion = dlmread(name, separator,
            [skipped_rows, skipped_columns, last_row-1, last_column-1]);
endfunction