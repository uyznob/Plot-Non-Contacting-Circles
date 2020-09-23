clc, clear, close all;

%% Bounded boundary
x0 = 0; y0 = 0; x1 = 10; y1 = 10;
rectangle('Position',[x0 y0 x1 y1],'FaceColor',[0.75 0.75 0.75])
axis([0 10 0 10])

%Domain area
darea = 20*5;

%Total area of Mesoscopic modeling
marea = 0.75*darea;

%% Plot Mesoscopic Modeling

cirdata = [];
disdata = [];
tcarea = 0;
i = 0;
icount = 0;
rmin = 0.1;
rmax = 0.7;

while tcarea<marea
    icount = icount+1
    if icount>50000
        break;
    end
    i = i+1;
    
%     x = rand(1)*x1;
%     y = rand(1)*y1;
    
    x = randi([x0*10+rmax*10 x1*10-rmax*10],1)/10;
    y = randi([y0*10+rmax*10 y1*10-rmax*10],1)/10;
    
    cirdata(i,1) = x;
    cirdata(i,2) = y;
    
    disdata = [];
    for j = 1:i-1
        disdata = [disdata; distance(x,y,cirdata(j,1),cirdata(j,2))];   
    end
            
%     if i==1
% %         r = rmin+rand(1)*0.5;
%         r = randi([1 10],1)*0.05;
%     else
% %         r = max(rmin+rand(1)*0.5,min(disdata)*rand(1)*0.4);
%         r = max(randi([1 10],1)*0.05,min(disdata)*rand(1)*0.4);
%     end

    r = randi([rmin*10 rmax*10],1)/10;
    
    cirdata(i,3) = r;
    if i~=1
        collisioncir  = disdata-cirdata(1:i-1,3)-r*ones(i-1,1);
        collisionboun(1) = x-x0-r;
        collisionboun(2) = x1-x-r;
        collisionboun(3) = y-y0-r;
        collisionboun(4) = y1-y-r;
        
        if (any(collisioncir(:,1)<0)~=0)||(any(collisionboun(:,1)<0)~=0)
            cirdata(i,:)=[];
            i = i-1;
            continue;
        end
    end
    
    carea = pi*r^2;
    tcarea = tcarea+carea;
    
    if r>= (rmax+rmin)/2 
        circle(x,y,r,'brown');
    else
        circle(x,y,r,'yellow');
    end
    
end
set(gca,'visible','off')
saveas(gcf,'Meso.png')
fprintf('Percentage of mescoscale area %f \n', tcarea/darea*100)