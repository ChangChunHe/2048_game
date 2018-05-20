function main_ai(~, ~)
global board fail_tag 
while 1
    player = 0;
    opponent = 1;
    current = 0;
    depth = 8;
    alph = -1000;beta = 1000;
    [~, direct] = minmax_pruning(board, player,opponent, current, depth, alph, beta);
    if direct == 1
        left_operation
    elseif direct == 2
        up_operation
    elseif direct == 3
        right_operation
    else
        down_operation
    end
    drawnow
    %title(num2str(score))
    if fail_tag 
        break
    end
end
