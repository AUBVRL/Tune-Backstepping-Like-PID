%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 'Plot_K_12_vs_KPD.m' draws the plot of solution set for:
%
%       k_1^2 - Kd*k_1 + Kp-gamma-1 = 0,
%       k_2 = Kd - k_1,
%
% for a set of constant (Kp-gamma) values then for a set of constant Kd
% values.
% The above equation is an approximation that is valid only if:
%
%      k_1*k_2 + 1 >> Ki/k_1,
%
% where gamma = Ki/k_1.
%
% -------------------------------------------------------------------------
% Inputs:
%   -Kp: proportional gain the PID control law
%   -Kd: derivative gain of the PID controller
%   -gamma:  adaptation gain of the adaptive backstepping controller
%
% -------------------------------------------------------------------------
% Outputs:
%   -k1:  1st gain of the adaptive backstepping controller
%   -k2:  2nd gain of the adaptive backstepping controller
%
% -------------------------------------------------------------------------
% Created by Ahmad Kourani, PhD candidate, August 2020
% Vision and Robotics Lab,
% American University of Beirut.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialize:
clear
close all
step =100;

stream_line = [];
x0=9; 
y0=4; %position of the lower left side of the figure
width=3.8;
height=1.6;
figure('Units','inches',...
'Position',[x0 y0 width height],...
'PaperPositionMode','auto');

ax1 = subplot(1,2,1);
hold on

set(gca,...
'Units','normalized',...
'FontUnits','points',...
'FontWeight','normal',...
'FontSize',8,...
'FontName','Times') % 'YTick',-0.5:.5:1.5,... 'XTick',0:Dticks_time:ticks_time_end,...

box on
grid on
set(gca,'gridlinestyle','-')

%% Kd constant:
gamma = 0;
Kd=[1:2:8]'; % define your desired set of constant Kd gains

for j = 1:length(Kd)
    k1=[];
    k2=[];
    Kp=[0:0.001:Kd(j)^2/4+gamma+1]'; % >1

    for i = 1:length(Kp)
        r = roots([1 -Kd(j) Kp(i)-gamma-1]);
        if imag(r) == 0
            k1(i,1) = max(r);
            k2(i,1) = min(r);
        else
            i=i-1;
            break
        end
    end
    
        index = find(Kp-1 > 0);
        plot(Kp(index(1):step:i),k1(index(1):step:i),'r')
        plot(Kp(index(1):step:i),k2(index(1):step:i),'g')
        stream_line = [stream_line;Kp(i),k1(i-1,1)];
end

plot(stream_line(:,1),stream_line(:,2),'*b-')
xlabel('$k_{\mathrm{P}}-\gamma$','Interpreter','latex')
ylabel('$k_1,k_2$','Interpreter','latex')

axis([0 8 0 5])
%pause()

%% Kp contant:

ax1 = subplot(1,2,2);
hold on

Kp=[1,5,10]'; % >1, % define your desired set of constant Kp gains
stream_line = [];
k1=[];
k2=[];

set(gca,...
'Units','normalized',...
'FontUnits','points',...
'FontWeight','normal',...
'FontSize',8,...
'FontName','Times') 
% 'YTick',-0.5:.5:1.5,... 'XTick',0:Dticks_time:ticks_time_end,...

box on
grid on
set(gca,'gridlinestyle','-')


for j = 1:length(Kp)
    k1=[];
    k2=[];
    index=[];
    Kd=[2*sqrt(Kp(j)-gamma-1):0.001:10]';
    for i = 1:length(Kd)
        
        r = roots([1 -Kd(i) Kp(j)-gamma-1]);
        if imag(r(1)) == 0 && min(r)>=0
            if isempty(index) index = i; end
            k1(i,1) = max(r);
            k2(i,1) = min(r);
        else
            k1(i,1) = NaN;
            k2(i,1) = NaN;            
        end
    end
    plot([Kd(1:step:index);Kd(index:step:end)],[k1(1:step:index);k1(index:step:end)],'r')
    plot([Kd(1:step:index);Kd(index:step:end)],[k2(1:step:index);k2(index:step:end)],'g')
    % pause()
    if i~=1
        stream_line = [stream_line;Kd(index),k1(index,1)];
    end 
end

plot(stream_line(:,1),stream_line(:,2),'*b-')
xlabel('$k_{\mathrm{D}}$','Interpreter','latex') %  ,'feasibility boundary'
ylabel('$k_1,k_2$','Interpreter','latex')
lgd=legend('$k_1$','$k_2$');
set(lgd,'FontUnits','points',...
'interpreter','latex',...
'FontSize',7,...
'FontName','Times',...
'Location','NorthEast')
%axis([0 10 0 10])
set(gca,...
    'Units','normalized',...
    'YTick',0:2:10,...
    'XTick',0:2:10,...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',8,...
    'FontName','Times')

%% 
% print as pdf:
set(gcf,'Units','inches');
screenposition = get(gcf,'Position');
set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
print -dpdf -painters K12_vs_Kpd_0

% % 
% k1=2;
% k2= 5;
% Kp=1+k1*k2+gamma
% Kv=k1+k2