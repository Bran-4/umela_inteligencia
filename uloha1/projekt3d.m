clc; clear; close all;

x = -800:5:800; 
y = -800:5:800;
z=-800:5:800;
[X, Y,Z] = meshgrid(x, y,z);

Pop = [X(:), Y(:),Z(:)];
W = testfn3b(Pop);
W = reshape(W, size(X));



min=horolezec3d();
for i=1:20
    a=horolezec3d();
    if testfn3b(a)<testfn3b(min)
        min=a;
    end
end
disp(min);
disp(testfn3b(min));