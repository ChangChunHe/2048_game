function restart(~,~)
global h start_tag h_patch
if start_tag == 0
    start_tag = 1;
    delete(h(~isnan(h)))
    delete(h_patch(~isnan(h_patch)))
    start
end
end