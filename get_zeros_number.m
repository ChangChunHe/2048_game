function count = get_zeros_number(board)
idx = find(board == 0);
count = length(idx);