t = 0:2*pi/50:2*pi;
x = 2*cos(t);
y = 5*sin(t);

figure;
plot(x,y); %b)
axis equal; %c)
title("Grafico");
xlabel("x");
ylabel("y");
grid on;