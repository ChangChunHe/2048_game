function direction = get_best_direct(board, score, depth)
alpha_val = -2^32;
beta_val = 2^32;
player = 1;
[direction, ~] = alpha_beta(board, score, depth, alpha_val, beta_val, player);