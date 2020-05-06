function plotta(deltaX,iterations)
    figure('Name','Evolution of parameters perturbation','NumberTitle','off')
    tiledlayout(2,4)

    nexttile
    plot(iterations,deltaX(1,:))
    grid on
    xlabel('Images');
    ylabel('\Delta fx');
    title('\Delta fx')

    nexttile
    plot(iterations,deltaX(2,:))
    grid on
    xlabel('Images');
    ylabel('\Delta fy');
    title('\Delta fy')

    nexttile
    plot(iterations,deltaX(3,:))
    grid on
    xlabel('Images');
    ylabel('\Delta u0');
    title('\Delta u0')

    nexttile
    plot(iterations,deltaX(4,:))
    grid on
    xlabel('Images');
    ylabel('\Delta v0');
    title('\Delta v0')

    nexttile
    plot(iterations,deltaX(5,:))
    grid on
    xlabel('Images');
    ylabel('\Delta k1');
    title('\Delta k1')

    nexttile
    plot(iterations,deltaX(6,:))
    grid on
    xlabel('Images');
    ylabel('\Delta k2');
    title('\Delta k2')

    nexttile
    plot(iterations,deltaX(7,:))
    grid on
    xlabel('Images');
    ylabel('\Delta p1');
    title('\Delta p1')

    nexttile
    plot(iterations,deltaX(8,:))
    grid on
    xlabel('Images');
    ylabel('\Delta p2');
    title('\Delta p2');
    a=1;
end