function board_1 = next_up(board)
board_1 = zeros(4);
for k = 1:size(board,1)
    tmp = operation(board(:, k));
    board_1(:, k) = [tmp';zeros(4-length(tmp), 1)];
end
