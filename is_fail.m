function is_fail
global board fail_tag
if find(board==0)
    return
else
    if(get_zeros_number(board) == 0)%If no more available cells
        score = 0;
        ptsUp = move(board, score, 1);
        ptsRight = move(board, score, 2);
        ptsDown = move(board, score, 3);
        ptsLeft = move(board, score, 4);
        if((ptsUp == 0) && (ptsRight == 0) && (ptsDown == 0) && (ptsLeft == 0))
            fail_tag = 1;
            draw_board
            hgo = text(2, 5.5,'You have lost','fontsize',36,'fontweight','bold',...
                'fontname', 'Times New Roman',...
                'color',[1,0,0]);
            fail_tag = 1;
            pause(1)
            if ~isempty(hgo)
                delete(hgo);
            end
        end
        
    end
end
