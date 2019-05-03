function plot_4d_poly(C)
    font = 20;
    figure
    plot(projection(intersect(C, Polyhedron('Ae', [1 0 0 0], 'be', [0])), [2 3 4]), 'alpha', 0.5)
    xlabel('$v$', 'Interpreter', 'latex', 'FontSize', font)
    ylabel('$\psi$', 'Interpreter', 'latex', 'FontSize', font)
    zlabel('$r$', 'Interpreter', 'latex', 'FontSize', font)
    tightplot('../figures/lk/poly1');

    figure
    plot(projection(intersect(C, Polyhedron('Ae', [0 1 0 0], 'be', [0])), [1 3 4]), 'alpha', 0.5)
    xlabel('$y$', 'Interpreter', 'latex', 'FontSize', font)
    ylabel('$\psi$', 'Interpreter', 'latex', 'FontSize', font)
    zlabel('$r$', 'Interpreter', 'latex', 'FontSize', font)
    tightplot('../figures/lk/poly2');

    figure
    plot(projection(intersect(C, Polyhedron('Ae', [0 0 1 0], 'be', [0])), [1 2 4]), 'alpha', 0.5)
    xlabel('$y$', 'Interpreter', 'latex', 'FontSize', font)
    ylabel('$v$', 'Interpreter', 'latex', 'FontSize', font)
    zlabel('$r$', 'Interpreter', 'latex', 'FontSize', font)
    tightplot('../figures/lk/poly3');

    figure
    plot(projection(intersect(C, Polyhedron('Ae', [0 0 0 1], 'be', [0])), [1 2 3]), 'alpha', 0.5)
    xlabel('$y$', 'Interpreter', 'latex', 'FontSize', font)
    ylabel('$v$', 'Interpreter', 'latex', 'FontSize', font)
    zlabel('$\psi$', 'Interpreter', 'latex', 'FontSize', font)
    tightplot('../figures/lk/poly4');
end