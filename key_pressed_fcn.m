function key_pressed_fcn(fig_obj,eventDat)
global key
get(fig_obj, 'CurrentKey');
get(fig_obj, 'CurrentCharacter');
get(fig_obj, 'CurrentModifier');
key = eventDat.Key;

switch key
    case 'leftarrow'
        left_operation
    case 'rightarrow'
        right_operation
    case 'downarrow'
        down_operation
    case 'uparrow'
        up_operation
    otherwise
        return ;
end