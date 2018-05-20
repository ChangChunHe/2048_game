function [score, direct] = minmax_pruning(board, player, opponent, current, depth, alph, beta)
if depth == 0
    score = evaluate_board(board);
    return
end

move_to_return = 0;

for ii = 1:4
    if current == player % if current player is you
        if ii == 1
            next_state = next_left(board);
        elseif ii == 2
            next_state = next_up(board);
        elseif ii == 3
            next_state = next_right(board);
        elseif ii == 4
            next_state = next_down(board);
        end
        
        tmp_current = opponent;
        
    else % current player is computer
        ind_zero = find(board == 0);
        
        next_state = board;
        if ~isempty(ind_zero)
            tmp_score = zeros(length(ind_zero),1);
            for k = 1:length(ind_zero)
                next_state(ind_zero(k)) = 2;
                tmp_score(k) = evaluate_board(next_state);
                next_state(ind_zero(k)) = 0;
            end
            [~,q] = min(tmp_score);
            
            next_state(ind_zero(q)) = 2;
            
        end
        
        tmp_current = player;
        
    end
    
    score = minmax_pruning(next_state, player, opponent, tmp_current, depth-1, alph, beta);
    
    if current == player
        if score > alph
            alph = score;
            move_to_return = ii;
        end
        if alph >= beta
            break
        end
    else
        if score < beta
            beta = score;
        end
        if alph >= beta
            break
        end
    end
    
    if current == opponent
        break
    end
end

if current == player
    score = alph;direct = move_to_return;
    
    if direct == 1 && all(all(board == next_left(board)));
        direct = randperm(4);direct = direct(1);
        
    elseif direct == 2 && all(all(board == next_up(board)));
        direct = randperm(4);direct = direct(1);
        
    elseif direct == 3 && all(all(board == next_right(board)));
        direct = randperm(4);direct = direct(1);
        
    elseif direct == 4 && all(all(board == next_down(board)));
        direct = randperm(4);direct = direct(1);
    end

else
    score = beta; direct = 0;
end
