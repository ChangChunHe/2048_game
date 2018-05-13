function main
clear
close all
clc
global  hax start_tag fail_tag all_color
fail_tag = 0;
all_color = [
    13 69 19      238,231,221   %2
    13 126 102    238,226,202 %4
    255 255 255    240,174,121          %8
    255 255 255    238,142,82          %16
    255 255 255    247,124,90          %32
    255 255 255    239,89,46           %64
    255 255 255    244,218,107          %128
    255 255 255    247,211,73      %256
    255 255 255    233,194,41          %512
    255 255 255    255,215,0           %1024
    255 255 255    237,198,2          %2048
    255 255 255    255,165,0         %4096
    255 255 255    255,165,0         %4096
    255 255 255    255,165,0         %4096
    255 255 255    255,165,0         %4096
    ];
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
% axis off
x = repmat([1; 5], 1, 5);
y = [1:5; 1:5];
line(x, y, 'color', 'k', 'linewidth', 3)
line(y, x, 'color', 'k', 'linewidth', 3)
start_tag = 1;
uicontrol('style', 'text', 'string', '2048 game', 'fontsize', 40, 'fontname', 'Times New Roman',...
    'units', 'normal', 'position', [0.05,0.8,0.26,0.08], 'parent', hf, ...
    'ForegroundColor', 'w', 'backgroundcolor', [0.3 0.3 0.3],...
    'fontweight', 'bold');
uicontrol('style', 'pushbutton', 'string', 'Start', 'fontsize', 18, 'fontname', 'Times New Roman',...
    'units', 'normal', 'position', [0.04 0.6 0.1 0.1], 'parent', hf, ...
    'fontweight', 'bold', 'callback', @start);
uicontrol('style', 'pushbutton', 'string', 'Restart', 'fontsize',18, 'fontname', 'Times New Roman',...
    'units', 'normal', 'position',[0.18 0.6 0.1, 0.1], 'parent', hf,...
    'fontweight', 'bold', 'callback', @restart);
% operation uicontrol
uicontrol('style', 'pushbutton', 'string', 'left', 'fontsize',18, 'fontname', 'Times New Roman',...
    'units', 'normal', 'position',[0.02 0.3 0.1, 0.1], 'parent', hf,...
    'fontweight', 'bold', 'callback', @left_operation);
uicontrol('style', 'pushbutton', 'string', 'right', 'fontsize',18, 'fontname', 'Times New Roman',...
    'units', 'normal', 'position',[0.2 0.3 0.1, 0.1], 'parent', hf,...
    'fontweight', 'bold', 'callback', @right_operation);
uicontrol('style', 'pushbutton', 'string', 'up', 'fontsize',18, 'fontname', 'Times New Roman',...
    'units', 'normal', 'position',[0.1 0.45 0.1, 0.1], 'parent', hf,...
    'fontweight', 'bold', 'callback', @up_operation);
uicontrol('style', 'pushbutton', 'string', 'down', 'fontsize',18, 'fontname', 'Times New Roman',...
    'units', 'normal', 'position',[0.1 0.15 0.1, 0.1], 'parent', hf,...
    'fontweight', 'bold', 'callback', @down_operation);


set(gcf,'KeyPressFcn', @key_pressed_fcn);
end

function down_operation(~,~)
global board rate_2 fail_tag start_tag
% down operation
if fail_tag == 1
    return
end
if start_tag == 0
    start
end
board_1 = zeros(4);
for k = 1:size(board,2)
    tmp = flipud(operation(flipud(board(:, k)))')';
    board_1(:, k) = [zeros(4-length(tmp), 1); tmp'];
end
if all(all(board_1 == board))
    is_fail
    return
else
    board = board_1;
end
add_ind = find(board == 0);
if ~isempty(add_ind)
    choice = randperm(length(add_ind));
    if rand < rate_2
        board(add_ind(choice(1))) = 2;
    else
        board(add_ind(choice(1))) = 4;
    end
    is_fail
else
    is_fail
    return
end
draw_board
end

function  draw_board
global board h h_patch all_color
delete(h(~isnan(h)))
h(~isnan(h)) = NaN;
delete(h_patch(~isnan(h_patch)))
h_patch(~isnan(h_patch)) = NaN;
len_ = [2.1 1.05 0.68 0.48 0.39 0.33 0.27 0.23 0.21 0.18 0.16 0.15 0.14];
for ii = 1:4
    for jj = 1:4
        if board(ii, jj) ~= 0
            tmp = board(ii, jj);
            %[r,g,b] = rgb(0, 12, abs(log2(tmp)));
            len = log(tmp);
            num = log2(tmp);
            
            h_patch(ii, jj) = patch([jj, jj+1, jj+1, jj], [5-ii, 5-ii, 6-ii, 6-ii],  all_color(num, 4:6)/255);
            h(ii, jj) = text(jj-1+len*len_(log2(tmp)), 5.5-ii, num2str(tmp), 'color',all_color(num, 1:3)/255, 'fontsize', 20);
            %set(h_patch(ii, jj), 'FaceAlpha',0.8)
        end
    end
end
end

function is_fail
global board fail_tag
if find(board==0)
    return
else
    nearest = [1 0; 0 1; -1 0; 0 -1];
    for ii = 1:size(board,1)
        for jj = 1:size(board,2)
            cen = board(ii, jj);
            near_ind = repmat([ii, jj], 4, 1)+nearest;
            q1 = find(near_ind(:,1)<=0); q2 = find(near_ind(:,1)>size(board,2));q = union(q1,q2);
            near_ind(q,:) = [];
            q1 = find(near_ind(:,2)<=0); q2 = find(near_ind(:,2)>size(board,1));q = union(q1,q2);
            near_ind(q,:) = [];
            for kk = 1:size(near_ind,1)
                if cen == board(near_ind(kk,1),  near_ind(kk,2))
                    return
                end
            end
        end
    end
    draw_board
    hgo = text(2, 5.5,'You have lost','fontsize',36,'fontweight','bold',...
        'fontname', 'Times New Roman',...
        'color',[1,0,0]);
    fail_tag = 1;
    pause(3)
    delete(hgo);
end
end

function key_pressed_fcn(fig_obj,eventDat)
global key
get(fig_obj, 'CurrentKey');
get(fig_obj, 'CurrentCharacter');
get(fig_obj, 'CurrentModifier');
key = eventDat.Key;
switch key
    case 'leftarrow'
        left_operation
    case 'rightarrow'
        right_operation
    case 'downarrow'
        down_operation
    case 'uparrow'
        up_operation
    otherwise
        return ;
end
end

function left_operation(~, ~)
global board rate_2 fail_tag start_tag
% left operation
if fail_tag == 1
    return
end
if start_tag == 0
    start
end
board_1 = zeros(4);
for k = 1:size(board,1)
    tmp = operation(board(k,:));
    board_1(k,:) = [tmp zeros(1, 4-length(tmp))];
end
if all(all(board_1==board))
    is_fail
    return
else
    board = board_1;
end
add_ind = find(board==0);
if ~isempty(add_ind)
    choice = randperm(length(add_ind));
    if rand < rate_2
        board(add_ind(choice(1))) = 2;
    else
        board(add_ind(choice(1))) = 4;
    end
    is_fail
else
    is_fail
    return
end
draw_board

end

function new_a = operation(a)
% a = [4 4 2 4];
a = a(a>0);
new_a = [];
k = 1;
while k <= length(a)
    if k == length(a)
        new_a = [new_a a(k)];
        break
    end
    if a(k) == a(k+1)
        new_a = [new_a a(k)+a(k+1)];
        k = k + 2;
    else
        new_a = [new_a a(k)];
        k = k + 1;
    end
end
end


function restart(~,~)
global h start_tag h_patch
if start_tag == 0
    start_tag = 1;
    delete(h(~isnan(h)))
    delete(h_patch(~isnan(h_patch)))
    start
end
end


function right_operation(~, ~)
global board rate_2 fail_tag start_tag
% right operation
if fail_tag == 1
    return
end
if start_tag == 0
    start
end
board_1 = zeros(4);
for k = 1:size(board,1)
    tmp = fliplr(operation(fliplr(board(k,:))));
    board_1(k,:) = [zeros(1, 4-length(tmp)) tmp];
end
if all(all(board_1==board))
    is_fail
    return
else
    board = board_1;
end
add_ind = find(board == 0);
if ~isempty(add_ind)
    choice = randperm(length(add_ind));
    if rand < rate_2
        board(add_ind(choice(1))) = 2;
    else
        board(add_ind(choice(1))) = 4;
    end
    is_fail
else
    is_fail
    return
end
draw_board
end


function start(~, ~)
global board h start_tag rate_2 h_patch

if start_tag == 1
    h = zeros(15)*NaN;
    h_patch = h;
    board = zeros(4);
    rate_2 = 0.8;
    choice = randperm(16);
    site = choice(1:2);
    for k = 1:2
        if rand < rate_2
            board(site(k)) = 2;
        else
            board(site(k)) = 4;
        end
    end
    draw_board
    start_tag = 0;
else
    return
end
end


function up_operation(~, ~)
global board rate_2 fail_tag start_tag
% up operation
if fail_tag == 1
    return
end
if start_tag == 0
    start
end
board_1 = zeros(4);
for k = 1:size(board,1)
    tmp = operation(board(:, k));
    board_1(:, k) = [tmp';zeros(4-length(tmp), 1)];
end
if all(all(board_1 == board))
    is_fail
    return
else
    board = board_1;
end

add_ind = find(board == 0);
if ~isempty(add_ind)
    choice = randperm(length(add_ind));
    if rand < rate_2
        board(add_ind(choice(1))) = 2;
    else
        board(add_ind(choice(1))) = 4;
    end
    is_fail
else
    is_fail
    return
end
draw_board
end