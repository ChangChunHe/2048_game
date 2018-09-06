function direction = get_next_direct(board)
persistent score
if isempty(score)
    score = 0;
end
board(isnan(board)) = 0;
d = {'up', 'right', 'down', 'left'};
depth = 5;
hint = get_best_direct(board, score, depth);
[~, newBoard, newScore] = move(board, score, hint);
score = newScore;
if(isequal(newBoard, board))
    switch (hint)
        case 1
            newMat = [2 3 4];
        case 2
            newMat = [1 3 4];
        case 3
            newMat = [1 2 4];
        case 4
            newMat = [1 2 3];
        otherwise
            newMat = [1 2 3 4];
    end
    hint = newMat(randi(3));
end
direction = d(hint);
end
