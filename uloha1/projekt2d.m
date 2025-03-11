clc; clear; close all;

x = -800:5:800; 
y = -800:5:800;
[X, Y] = meshgrid(x, y);

Pop = [X(:), Y(:)];
Z = testfn3b(Pop);
Z = reshape(Z, size(X));

surf(X, Y, Z, 'EdgeColor', 'none');
colormap sky;
grid on;
hold on;

min=horolezec2d();
for i=1:20
    a=horolezec2d();
    if testfn3b(a)<testfn3b(min)
        min=a;
    end
end
plot3(min(1),min(2), testfn3b(min), 'yo', 'MarkerSize', 8, 'MarkerFaceColor', 'y'); 
disp(min);disp(testfn3b(min));
hold off;