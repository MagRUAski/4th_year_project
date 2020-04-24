%Coordinates obtained by localization
clear;
RPNUM = 25;
xm = 60000;
ym = 60000;
zm = -30;
AUV = [0,0,0];
vAUV = 10*0.5144; %10 knots

for i=1:1:RPNUM
        RP(i).x=unifrnd(0,1)*xm;       %Generate coordinates uniformly
        RP(i).y=unifrnd(0,1)*ym;
        RP(i).z=unifrnd(0,1)*zm;
        
        figure(1);
        subplot(2,1,1);
        plot3(RP(i).x,RP(i).y, RP(i).z,'o');
        text(RP(i).x,RP(i).y, RP(i).z,num2str(i));
        title('3D Postions of rendezvous points');
        grid on;
        hold on;
        subplot(2,1,2);
        plot(RP(i).x,RP(i).y,'o');
        text(RP(i).x,RP(i).y,num2str(i));
        title('2D Postions of rendezvous points');
        grid on;
        hold on;
end

hold off;

%Calculate Adjacency Matrix
for m=1:1:RPNUM
    for n=1:1:RPNUM
    adjacency(m,n) = sqrt((RP(m).x - RP(n).x)^2+(RP(m).y - RP(n).y)^2+(RP(m).z - RP(n).z)^2);
    end
end

save coor



