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
    last_merge_position = 1;
    for j = 2:n
        if(board(i,j)==0)
            continue; %skip moving zeros
        end 
        previous_position = j-1;
              while((previous_position>last_merge_position) && (board(i,previous_position)==0)) %skip all the zeros
                    previous_position = previous_position - 1;
              end
                if(previous_position==j)
                    %we can't move this at all
                elseif(board(i,previous_position)==0)
                    %move to empty value
                    board(i,previous_position)=board(i,j);
                    board(i,j)=0;
                elseif(board(i,previous_position)==board(i,j))
                    %merge with matching value
                    board(i,previous_position) = 2 * board(i,previous_position);
                    board(i,j)=0;
                    points=points+board(i,previous_position);
                    last_merge_position=previous_position+1;
                elseif((board(i,previous_position)~=board(i,j)) && ((previous_position+1)~=j))
                    board(i,(previous_position+1))=board(i,j);
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
