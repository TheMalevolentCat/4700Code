%lab 3

nx = 10;
ny = 10;

old = zeros(ny, nx);
old(:,1) = 1;
old(:,nx) = 0;
new = old;

for m = 1:500
    for i = 1:nx
        for j = 1:ny
          if i < nx && i > 1 && j < ny && j > 1  
            new(j,i) = (old(j,i-1) + old(j,i+1) + old(j-1,i) + old(j+1,i)) / 4;
          end
             
          if i == 1              
           new(j,i) = 1;
          elseif i == nx
           new(j,i) = 1;
          end
          
          if j == 1
           %new(j,i) = old(j + 1, i);
           new(j,i) = 0;
          elseif j == ny
           %new(j,i) = old(j - 1, i);
           new(j,i) = 0;
          end
        end
    end
    old = new;
    [X,Y] = meshgrid(1:nx, 1:ny);
    
    figure(1)
    surf(X,Y,new);
   
    %pause(0.001);
end

[Ex, Ey] = gradient(new);

B = imboxfilt(new, 3);

figure(2)
surf(X,Y,B);

figure('name', 'electric field')
quiver(X, Y, Ex, Ey);


