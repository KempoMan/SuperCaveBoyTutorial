///get_input

right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
jump = keyboard_check_pressed(vk_space);
jumpRelease = keyboard_check_released(vk_space);

// Override the controls for a gamepad
var gp_id = 0;
var thresh = .5;

if(gamepad_is_connected(gp_id)){
    right = gamepad_axis_value(gp_id, gp_axislh) > thresh;
    left = gamepad_axis_value(gp_id, gp_axislh) < -thresh;
    up = gamepad_axis_value(gp_id, gp_axislv) < -thresh;
    down = gamepad_axis_value(gp_id, gp_axislv)  > thresh;
    jump = gamepad_button_check_pressed(gp_id, gp_face1);
    jumpRelease = gamepad_button_check_released(gp_id, gp_face1);    
}
