function start(~, ~)
global board h start_tag rate_2 h_patch

if start_tag == 1
    h = zeros(15)*NaN;
    h_patch = h;
    board = zeros(4);
    rate_2 = 0.8;
    choice = randperm(16);
    site = choice(1:2);
    for k = 1:2
        if rand < rate_2
            board(site(k)) = 2;
        else
            board(site(k)) = 4;
        end
    end
    draw_board
    start_tag = 0;
else
    return
end
end
