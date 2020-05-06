function plotta(deltaX,iterations)
    figure('Name','Evolution of parameters perturbation','NumberTitle','off');
    subplot(2,4,1)
    plot(iterations,deltaX(1,:));
    grid on
    xlabel('Images');
    ylabel('\Delta fx');
    title('\Delta fx')

    subplot(2,4,2)
    plot(iterations,deltaX(2,:))
    grid on
    xlabel('Images');
    ylabel('\Delta fy');
    title('\Delta fy')

    subplot(2,4,3)
    plot(iterations,deltaX(3,:));
    grid on
    xlabel('Images');
    ylabel('\Delta u0');
    title('\Delta u0')

    subplot(2,4,4)
    plot(iterations,deltaX(4,:));
    grid on
    xlabel('Images');
    ylabel('\Delta v0');
    title('\Delta v0')

    subplot(2,4,5)
    plot(iterations,deltaX(5,:));
    grid on
    xlabel('Images');
    ylabel('\Delta k1');
    title('\Delta k1')

    subplot(2,4,6)
    plot(iterations,deltaX(6,:));
    grid on
    xlabel('Images');
    ylabel('\Delta k2');
    title('\Delta k2')

    subplot(2,4,7)
    plot(iterations,deltaX(7,:));
    grid on
    xlabel('Images');
    ylabel('\Delta p1');
    title('\Delta p1')

    subplot(2,4,8)
    plot(iterations,deltaX(8,:));
    grid on
    xlabel('Images');
    ylabel('\Delta p2');
    title('\Delta p2');
endfunction