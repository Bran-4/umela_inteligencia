clc;clear;

x=-800:5:800;
Pop=x';
Fit=testfn3b(Pop);
plot(x,Fit);
hold on;
min=horolezec();
for i=1:9
    a=horolezec();
    if testfn3b(a)<testfn3b(min)
        min=a;
    end
end

plot(min, testfn3b(min), 'yo', 'MarkerSize', 8, 'MarkerFaceColor', 'y');
disp(min);disp(testfn3b(min));
hold off;
