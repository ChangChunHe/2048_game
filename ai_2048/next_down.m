function board_1 = next_down(board)
board_1 = zeros(4);
for k = 1:size(board,2)
    tmp = flipud(operation(flipud(board(:, k)))')';
    board_1(:, k) = [zeros(4-length(tmp), 1); tmp'];
end
