function  draw_board
global board h
delete(h(~isnan(h)))
h(~isnan(h)) = NaN;
len_ = [2.1 1.05 0.68 0.48 0.39 0.33 0.27 0.23 0.21 0.18 0.16 0.15];
for ii = 1:4
    for jj = 1:4
        if board(ii, jj) ~= 0
            tmp = board(ii, jj);
            [r,g,b] = rgb(0, 12, abs(log2(tmp)));
            len = log(tmp);
            h(ii, jj) = text(jj-1+len*len_(log2(tmp)), 5.5-ii, num2str(tmp), 'color',[r,g,b]/255, 'fontsize', 20);
        end
    end
end
end