function h = circle(x,y,r,col)
hold on
% th = 0:pi/50:2*pi;
% xunit = r * cos(th) + x;
% yunit = r * sin(th) + y;
% h = plot(xunit, yunit, 'Color', 'b');

switch col
    case 'brown'
        cvec = [0.25 0.75 1];
    case 'yellow'
        cvec = [1 1 0];
end        
    
pos = [x y r r]; 
rectangle('Position',pos,'Curvature',[1 1],'EdgeColor','k','FaceColor',cvec)
axis equal

hold off
