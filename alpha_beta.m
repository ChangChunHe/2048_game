function [direction, out_score] = alpha_beta(board, score, depth, alpha_value, beta_value, player)
best_direction = 0;
if is_game_over(board, score)
    best_score = min([score, 1]);%lowest possible score
elseif depth == 0
    best_score = get_total_score(score, get_zeros_number(board), get_cluster_score(board));
else
    if player == 1
        for direct = 1:4
            new_board = board;
            new_score = score;
            [~, new_board, new_score] = move(new_board, new_score, direct);
            if isequal(new_board, board)
                continue;
            end
            [~, current_score] = alpha_beta(new_board, new_score, depth-1, alpha_value, beta_value, 0);%computer
            if current_score > alpha_value %maximize score
                alpha_value = current_score;
                best_direction = direct;
            end
            if beta_value <= alpha_value
                break; %beta pruning
            end
        end
        best_score = alpha_value;
    else
        [row, col] = get_zeros_ind(board);
        possible_values = [2, 4];
        flag = 0;
        len = length(row);
        for ind = 1:len
            i = row(ind);
            j = col(ind);
            len2 = length(possible_values);
            for ind2 = 1:len2
                value = possible_values(ind2);
                new_board = board;
                new_score = score;
                new_board(i, j) = value;
                [~, current_score] = alpha_beta(new_board, new_score, depth-1, alpha_value, beta_value, 1);%User
                if current_score < beta_value %minimize best score
                    beta_value = current_score;
                end
                if beta_value <= alpha_value
                    flag = 1;
                    break; %alpha pruning
                end
            end
            if flag == 1
                flag = 0;
                break; %alpha pruning
            end
        end
        best_score = beta_value;
        if len == 0 %moves is empty
            best_score = 0;
        end
    end
end
out_score = best_score;
direction = best_direction;
