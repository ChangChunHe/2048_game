function [points, board, score] = move(board, score, direct)
n = 4;
points = 0;
%rotate the board to simplify the merging algorithm
if direct == 1%up
    board = rot90(board);
elseif direct == 2%right
    board = rot90(board);
    board = rot90(board);
elseif direct == 3 %down
    board = rot90(board, 3);
end
for i = 1:n
    lastMergePosition = 1;
    for j = 2:n
        if(board(i,j)==0)
            continue; %skip moving zeros
        end 
        previousPosition = j-1;
              while((previousPosition>lastMergePosition) && (board(i,previousPosition)==0)) %skip all the zeros
                    previousPosition = previousPosition - 1;
              end
                if(previousPosition==j)
                    %we can't move this at all
                elseif(board(i,previousPosition)==0)
                    %move to empty value
                    board(i,previousPosition)=board(i,j);
                    board(i,j)=0;
                elseif(board(i,previousPosition)==board(i,j))
                    %merge with matching value
                    board(i,previousPosition) = 2 * board(i,previousPosition);
                    board(i,j)=0;
                    points=points+board(i,previousPosition);
                    lastMergePosition=previousPosition+1;
                elseif((board(i,previousPosition)~=board(i,j)) && ((previousPosition+1)~=j))
                    board(i,(previousPosition+1))=board(i,j);
                    board(i,j) = 0;
                end
    end
end
score = score + points;
if direct == 1%up
    board = rot90(board, 3);
elseif direct == 2%right
    board = rot90(board, 3);
    board = rot90(board, 3);
elseif direct == 3%down
    board = rot90(board);
end
