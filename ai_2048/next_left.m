function board_1 = next_left(board)

board_1 = zeros(4);
for k = 1:size(board,1)
    tmp = operation(board(k,:));
    board_1(k,:) = [tmp zeros(1, 4-length(tmp))];
end
