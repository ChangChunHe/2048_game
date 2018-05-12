function is_fail
global board fail_tag
if find(board==0)
    return
else
    nearest = [1 0; 0 1; -1 0; 0 -1];
    for ii = 1:size(board,1)
        for jj = 1:size(board,2)
            cen = board(ii, jj);
            near_ind = repmat([ii, jj], 4, 1)+nearest;
            q1 = find(near_ind(:,1)<=0); q2 = find(near_ind(:,1)>size(board,2));q = union(q1,q2);
            near_ind(q,:) = [];
            q1 = find(near_ind(:,2)<=0); q2 = find(near_ind(:,2)>size(board,1));q = union(q1,q2);
            near_ind(q,:) = [];
            for kk = 1:size(near_ind,1)
                if cen == board(near_ind(kk,1),  near_ind(kk,2))
                    return
                end
            end
        end
    end
    hgo = text(2, 3,'You have lost','fontsize',36,'fontweight','bold',...
        'fontname', 'Times New Roman',...
        'color',[1,0,0]);
    fail_tag = 1;
    pause(3)
    delete(hgo);
end
end