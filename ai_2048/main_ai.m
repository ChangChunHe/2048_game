function main_ai(~, ~)
global board fail_tag pauseAI_or_not
if fail_tag == 1
    return
end
pauseAI_or_not = 0;
while 1
    direct =  get_next_direct(board);
    if strcmp(direct, 'left')
        left_operation
    elseif strcmp(direct, 'up')
        up_operation
    elseif strcmp(direct, 'right')
        right_operation
    else
        down_operation
    end
    drawnow
    if fail_tag || pauseAI_or_not
        break
    end
%     frame=getframe(gcf);
%     im=frame2im(frame);
%     [I,map]=rgb2ind(im,256);
%     if k==1
%        imwrite(I,map,'out.gif','gif','LoopCount',inf);
%     else
%         imwrite(I,map,'out.gif','gif','WriteMode','append','DelayTime', 0.1);
%     end
%     k = k + 1;
end
