function restart(~,~)
global h start_tag
if start_tag == 0
    start_tag = 1;
    delete(h(~isnan(h)))
    start
end
end