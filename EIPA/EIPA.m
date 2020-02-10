clear, clc

ny = 50;
nx = 100;

G = sparse(nx*ny, nx*ny);
delta = 1;
neqn = @(i, j) j + (i - 1)*ny;

for i = 1:nx
    for j = 1:ny
        n = j + (i - 1)*ny;
        npx = j + (i)*ny;
        nmx = j + (i - 2)*ny;
        npy = 1 + j + (i - 1)*ny;
        nmy = j - 1 + (i - 1)*ny;
        
        if i == 1 || j == 1 || i == nx || j == ny
            G(n,n) = 1;
            
        elseif i > 10 && i < 20 && j > 10 && j < 20
            G(n,n) = -2 / (delta^2);
            G(n, npx) = 1 / (delta^2);
            G(n, nmx) = 1 / (delta^2);
            G(n, npy) = 1 / (delta^2);
            G(n, nmy) = 1 / (delta^2);
            
        else
            G(n,n) = -4 / (delta^2);
            G(n, npx) = 1 / (delta^2);
            G(n, nmx) = 1 / (delta^2);
            G(n, npy) = 1 / (delta^2);
            G(n, nmy) = 1 / (delta^2);
            
        end
    end
end

spy(G);

[E,D] = eigs(G,9,'SM');

En = 1:9;

for i = 1:9
    En(i) = D(i,i);
end

figure(1)
plot([1:9], En);

E1 = zeros(nx, ny);
E2 = zeros(nx, ny);
E3 = zeros(nx, ny);
E4 = zeros(nx, ny);
E5 = zeros(nx, ny);
E6 = zeros(nx, ny);
E7 = zeros(nx, ny);
E8 = zeros(nx, ny);
E9 = zeros(nx, ny);

for i = 1:nx
    for j = 1:ny
        n = j + (i - 1)*ny;
        E1(i, j) = E(n,1);
        E2(i, j) = E(n,2);
        E3(i, j) = E(n,3);
        E4(i, j) = E(n,4);
        E5(i, j) = E(n,5);
        E6(i, j) = E(n,6);
        E7(i, j) = E(n,7);
        E8(i, j) = E(n,8);
        E9(i, j) = E(n,9);
    end
end

subplot(3,3,1)
surf(E1);
subplot(3,3,2)
surf(E2);
subplot(3,3,3)
surf(E3);
subplot(3,3,4)
surf(E4);
subplot(3,3,5)
surf(E5);
subplot(3,3,6)
surf(E6);
subplot(3,3,7)
surf(E7);
subplot(3,3,8)
surf(E8);
subplot(3,3,9)
surf(E9);


