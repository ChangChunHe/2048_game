function is_over = is_game_over(board, score)
is_over = 0;
if get_zeros_number(board) == 0
    ptsUp = move(board, score, 1);
    ptsRight = move(board, score, 2);
    ptsDown = move(board, score, 3);
    ptsLeft = move(board, score, 4);
    if((ptsUp == 0) && (ptsRight == 0) && (ptsDown == 0) && (ptsLeft == 0))
        is_over = 1;
    end
end
