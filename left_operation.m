function left_operation(~, ~)
global board rate_2 fail_tag
% down operation
if fail_tag == 1
    return
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