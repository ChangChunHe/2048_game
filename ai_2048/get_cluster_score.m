function cluster_score =  get_cluster_score(board)
size_of_board = size(board);
cluster_score=0;
neighbors = [-1,0,1];
for i = 1:size_of_board(1)
    for j = 1:1:size_of_board(2)
        if board(i,j) == 0
            continue
        end
        num_neig=0;
        sum_tmp = 0;
        len = length(neighbors);
        for neiIdx1 = 1:len
            k = neighbors(neiIdx1);
            x = i+k;
            if x < 1 || x > size_of_board(1)
                continue
            end
            for neiIdx2 = 1:len
                l = neighbors(neiIdx2);
                y = j+l;
                if y < 1 || y > size_of_board(2)
                    continue
                end
                if board(x,y) > 0
                    num_neig = num_neig + 1;
                    sum_tmp = sum_tmp + abs(board(i,j)-board(x,y));
                end
            end
        end
        cluster_score = cluster_score + floor(sum_tmp/num_neig);%divided by number of neighbours
    end
end
