%Coordinates obtained by localization
clear all;
close all;

tic;
load('coor.mat');

%using function by Elad Kivelevitch

[DPplan,DPcost] = tsp_dp1(RP,adjacency);
tDelay = DPcost/vAUV;
hour = (tDelay - mod(tDelay,3600))/3600;
minute = (tDelay-hour*3600 - mod(tDelay-hour*3600,60))/60;
second = tDelay-hour*3600-minute*60;
traveldelay = [hour,minute,second];

DPplancoor = [RP(DPplan).x;RP(DPplan).y; RP(DPplan).z].';
toc;
        figure(2);
        for i=1:RPNUM
        subplot(2,1,1);
        plot3(RP(i).x,RP(i).y,RP(i).z,'o');
        text(RP(i).x,RP(i).y, RP(i).z,num2str(i));
        hold on;
        subplot(2,1,2);
        plot(RP(i).x,RP(i).y,'o');
        text(RP(i).x,RP(i).y,num2str(i));
        hold on;
        end
        subplot(2,1,1);
        plot3(DPplancoor(:,1),DPplancoor(:,2),DPplancoor(:,3),'r--');
        title('3D Path of AUV');
        grid on;
        subplot(2,1,2);
        plot(DPplancoor(:,1),DPplancoor(:,2),'r--');
        title('2D Path of AUV');
        grid on;

