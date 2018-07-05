function [sort_row, sort_col] = get_zeros_ind(board)
[row, col] = find((board == 0));
[sort_row, idx] = sort(row);
sort_col = col(idx);

