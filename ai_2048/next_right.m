function board_1 = next_right(board)
board_1 = zeros(4);
for k = 1:size(board,1)
    tmp = fliplr(operation(fliplr(board(k,:))));
    board_1(k,:) = [zeros(1, 4-length(tmp)) tmp];
end
