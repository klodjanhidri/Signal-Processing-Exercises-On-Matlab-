n = 1:15;
x = [7 6 5 4 4 4 4 10 10 10 8 8 7 6 0];

figure(1);
plot(n, x, '-o', 'LineWidth', 3, 'MarkerEdgeColor', 'k');
title('1D Signal');
xlabel('Samples');

dn = 1:15;
dx = diff([x x(end)],1);

figure(2);
plot(dn, dx, '-o', 'LineWidth', 3, 'MarkerEdgeColor','k');
title('First order difference of 1D signal');
xlabel('Samples');

dn2 = 1:13;
dx = 0.5*x(3:end) - 0.5*x(1:end-2)
figure(3);
plot(dn2, dx, '-o', 'LineWidth', 3,'MarkerEdgeColor','k');
title('Central difference of 1D signal');
xlabel('Samples');

