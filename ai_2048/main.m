function main
clear 
clear global
close all
clc
global  hax start_tag fail_tag all_color pauseAI_or_not
pauseAI_or_not = 0;
fail_tag = 0;
all_color = [
    13 69 19      238,231,221         %2
    13 126 102    238,226,202         %4
    255 255 255    240,174,121        %8
    255 255 255    238,142,82         %16
    255 255 255    247,124,90         %32
    255 255 255    239,89,46          %64
    255 255 255    244,218,107        %128
    255 255 255    247,211,73         %256
    255 255 255    233,194,41         %512
    255 255 255    255,215,0          %1024
    255 255 255    237,198,2          %2048
    255 255 255    255,165,0 ];       %4096

screen_size = get(0,'screensize');
mean_size = mean(screen_size(3:4));
hf = figure('resize','off','name','',...
    'position', [mean_size*0.25 mean_size*0.1 mean_size*0.7467 mean_size*0.56], 'numbertitle', 'off');
hax = axes;
set(gcf,'menubar', 'none','color', [238 220 130]/255)
set(gca,'position',[0.2500    0.1100    0.7750    0.8150])
set(gca, 'xlim', [0, 6], 'ylim', [0, 6])
set(hax, 'xtick', [], 'ytick', [], 'box', 'on')
set(hax, 'color', [255,255,224]/255)
set(hax, 'DataAspectRatio', [1 1 1], 'PlotBoxAspectRatio', [1 1 1])
x = repmat([1; 5], 1, 5);
y = [1:5; 1:5];
line(x, y, 'color', 'k', 'linewidth', 3)
line(y, x, 'color', 'k', 'linewidth', 3)
start_tag = 1;
uicontrol('style', 'text', 'string', '2048 game', 'fontsize', 40, 'fontweight','bold',...
        'fontname', 'Times New Roman',...
    'units', 'normal', 'position', [0.05,0.85,0.26,0.08], 'parent', hf, ...
    'ForegroundColor', 'w', 'backgroundcolor', [0.3 0.3 0.3],...
    'fontweight', 'bold');
uicontrol('style', 'pushbutton', 'string', 'Start', 'fontsize', 18, 'fontweight','bold',...
        'fontname', 'Times New Roman',...
    'units', 'normal', 'position', [0.04 0.6 0.1 0.1], 'parent', hf, ...
    'fontweight', 'bold', 'callback', @start);
uicontrol('style', 'pushbutton', 'string', 'Restart', 'fontsize',18, 'fontweight','bold',...
        'fontname', 'Times New Roman',...
    'units', 'normal', 'position',[0.18 0.6 0.1, 0.1], 'parent', hf,...
    'fontweight', 'bold', 'callback', @restart);
% uicontrol('style', 'pushbutton', 'string', 'left', 'fontsize',18, 'fontweight','bold',...
%         'fontname', 'Times New Roman',...
%     'units', 'normal', 'position',[0.02 0.35 0.1, 0.1], 'parent', hf,...
%     'fontweight', 'bold', 'callback', @left_operation);
% uicontrol('style', 'pushbutton', 'string', 'right', 'fontsize',18, 'fontweight','bold',...
%         'fontname', 'Times New Roman',...
%     'units', 'normal', 'position',[0.2 0.35 0.1, 0.1], 'parent', hf,...
%     'fontweight', 'bold', 'callback', @right_operation);
% uicontrol('style', 'pushbutton', 'string', 'up', 'fontsize',18, 'fontweight','bold',...
%         'fontname', 'Times New Roman',...
%     'units', 'normal', 'position',[0.1 0.5 0.1, 0.1], 'parent', hf,...
%     'fontweight', 'bold', 'callback', @up_operation);
% uicontrol('style', 'pushbutton', 'string', 'down', 'fontsize',18, 'fontweight','bold',...
%         'fontname', 'Times New Roman',...
%     'units', 'normal', 'position',[0.1 0.2 0.1, 0.1], 'parent', hf,...
%     'fontweight', 'bold', 'callback', @down_operation);
uicontrol('style', 'pushbutton', 'string', 'AI player', 'fontsize',18, 'fontweight','bold',...
        'fontname', 'Times New Roman',...
    'units', 'normal', 'position',[0.06 0.4 0.2, 0.1], 'parent', hf,...
    'fontweight', 'bold', 'callback', @main_ai);
uicontrol('style', 'pushbutton', 'string', 'Pause', 'fontsize',18, 'fontweight','bold',...
        'fontname', 'Times New Roman',...
    'units', 'normal', 'position',[0.06 0.25 0.2, 0.1], 'parent', hf,...
    'fontweight', 'bold', 'callback', @pause_AI);
uicontrol('style', 'pushbutton', 'string', 'Hint', 'fontsize',18, 'fontweight','bold',...
        'fontname', 'Times New Roman',...
    'units', 'normal', 'position',[0.06 0.1 0.2, 0.1], 'parent', hf,...
    'fontweight', 'bold', 'callback', @AIhint);
set(gcf,'KeyPressFcn', @key_pressed_fcn);