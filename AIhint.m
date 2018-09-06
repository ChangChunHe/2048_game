function AIhint(~,~)
global board title_h fail_tag
if fail_tag
    return
end
direction = get_next_direct(board);
if exist('title_h', 'var')
    delete(title_h)
end
title_h = text(3,5.5, direction, 'fontsize', 20);
end