function restart(~,~)
global h start_tag h_patch  fail_tag
if start_tag == 0
    start_tag = 1;
    fail_tag = 0;
    delete(h(~isnan(h)))
    delete(h_patch(~isnan(h_patch)))
    start
end
end
