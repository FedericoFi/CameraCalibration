function grid_pts=extract_grid_pts(name)
    opts=detectImportOptions(name);
    grid_pts=readmatrix(name,opts);
    %disp(grid_pts);
end
