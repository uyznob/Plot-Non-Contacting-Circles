P = [10,5,10] ;   % you center point 
L = [20,20,20] ;  % your cube dimensions 
O = P-L/2 ;       % Get the origin of cube so that P is at center 
plotcube(L,O,.8,[1 0 0]);   % use function plotcube 
hold on
plot3(P(1),P(2),P(3),'*k')