function plot_4d_poly(C)
    font = 20;
    figure
    plot(projection(intersect(C, Polyhedron('Ae', [1 0 0 0], 'be', [0])), [2 3 4]), 'alpha', 0.5)
    xlabel('$v$', 'Interpreter', 'latex', 'FontSize', font)
    ylabel('$\psi$', 'Interpreter', 'latex', 'FontSize', font)
    zlabel('$r$', 'Interpreter', 'latex', 'FontSize', font)
    xlim([-20, 20])
    ylim([-0.1, 0.1])
    zlim([-5, 5])
    tightplot('../figures/lk/poly1');

    figure
    plot(projection(intersect(C, Polyhedron('Ae', [0 1 0 0], 'be', [0])), [1 3 4]), 'alpha', 0.5)
    xlabel('$y$', 'Interpreter', 'latex', 'FontSize', font)
    ylabel('$\psi$', 'Interpreter', 'latex', 'FontSize', font)
    zlabel('$r$', 'Interpreter', 'latex', 'FontSize', font)
    xlim([-1, 1])
    ylim([-0.1, 0.1])
    zlim([-5, 5])
    tightplot('../figures/lk/poly2');

    figure
    plot(projection(intersect(C, Polyhedron('Ae', [0 0 1 0], 'be', [0])), [1 2 4]), 'alpha', 0.5)
    xlabel('$y$', 'Interpreter', 'latex', 'FontSize', font)
    ylabel('$v$', 'Interpreter', 'latex', 'FontSize', font)
    zlabel('$r$', 'Interpreter', 'latex', 'FontSize', font)
    xlim([-1, 1])
    ylim([-30, 30])
    zlim([-3, 3])
    tightplot('../figures/lk/poly3');

    figure
    plot(projection(intersect(C, Polyhedron('Ae', [0 0 0 1], 'be', [0])), [1 2 3]), 'alpha', 0.5)
    xlabel('$y$', 'Interpreter', 'latex', 'FontSize', font)
    ylabel('$v$', 'Interpreter', 'latex', 'FontSize', font)
    zlabel('$\psi$', 'Interpreter', 'latex', 'FontSize', font)
    xlim([-1, 1])
    ylim([-30, 30])
    zlim([-0.1, 0.1])
    tightplot('../figures/lk/poly4');
end