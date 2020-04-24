% Nearest Neighbor Method
clear all;
close all;

tic;
load('coor.mat');

k = 1;

Next = randi(RPNUM);

while(k<=RPNUM)
    Neighbors = adjacency(Next,:);
    Previous(k) = Next;
    Neighbors(Previous) = inf;
    Dissorted=sort(Neighbors,'ascend');  %sort distance

    i=1;
    Nexts=(find(Neighbors==Dissorted(i)));
    Next = Nexts(1);
    k=k+1;
end

NNPath = Previous;
NNPath(RPNUM+1)=NNPath(1);

NNPathcoor = [RP(NNPath).x;RP(NNPath).y; RP(NNPath).z].';
toc;

cost=0;
    for c = 2:RPNUM
        cost = cost + adjacency(NNPath(c-1),NNPath(c));
    end
    cost = cost + adjacency(NNPath(1),NNPath(RPNUM));

        figure(1);
        for i=1:RPNUM
        subplot(2,1,1);     %Plot all rendezvous points
        plot3(RP(i).x,RP(i).y,RP(i).z,'o');
        text(RP(i).x,RP(i).y, RP(i).z,num2str(i));
        hold on;
        subplot(2,1,2);
        plot(RP(i).x,RP(i).y,'o');
        text(RP(i).x,RP(i).y,num2str(i));
        hold on;
        end
        subplot(2,1,1);
        plot3(NNPathcoor(:,1),NNPathcoor(:,2),NNPathcoor(:,3),'r-.');
        title('3D Path of AUV');
        grid on;
        subplot(2,1,2);
        plot(NNPathcoor(:,1),NNPathcoor(:,2),'r-.');
        title('2D Path of AUV');
        grid on;