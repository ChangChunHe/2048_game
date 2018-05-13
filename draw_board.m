function  draw_board
global board h h_patch all_color
delete(h(~isnan(h)))
h(~isnan(h)) = NaN;
delete(h_patch(~isnan(h_patch)))
h_patch(~isnan(h_patch)) = NaN;

len_ = [2.1 1.05 0.68 0.48 0.39 0.33 0.27 0.23 0.21 0.18 0.16 0.15];
for ii = 1:4
    for jj = 1:4
        if board(ii, jj) ~= 0
            tmp = board(ii, jj);
            %[r,g,b] = rgb(0, 12, abs(log2(tmp)));
            len = log(tmp);
            num = log2(tmp);
            
            h_patch(ii, jj) = patch([jj, jj+1, jj+1, jj], [5-ii, 5-ii, 6-ii, 6-ii],  all_color(num, 4:6)/255);
            h(ii, jj) = text(jj-1+len*len_(log2(tmp)), 5.5-ii, num2str(tmp), 'color',all_color(num, 1:3)/255, 'fontsize', 20);
            %set(h_patch(ii, jj), 'FaceAlpha',0.8)
        end
    end
end
end