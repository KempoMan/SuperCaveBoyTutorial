///move_state()

// is player in the air? (gravity)
if(!place_meeting(x, y + 1, Solid)){
    vspd += grav;
    
    // player is in the air
    sprite_index = spr_player_jump;
    image_speed = 0;
    image_index = vspd > 0;
    
    // Control the jump height
    if(up_release && vspd < -6){
        vspd = -6;
    }
}else{
    vspd = 0;
    
    // Jumping code
    if(up){
        vspd = -16;
    }
    
    // player is on the ground
    if(hspd == 0){
        sprite_index = spr_player_idle;
    }else{
        sprite_index = spr_player_walk;
        image_speed = .6;
    }
}

if(right || left){
    hspd += (right - left) * acc;
    hspd_dir = right - left;
    
    if(hspd > spd) hspd = spd;
    if(hspd < -spd)hspd = -spd;
}else{
    apply_friction(acc);
}

if(hspd != 0){
    image_xscale = sign(hspd);
}

move(Solid);

/// Check for ledge grab state
var falling = y - yprevious > 0;
var wasnt_wall = !position_meeting(x + 17 * image_xscale, yprevious, Solid);
var is_wall = position_meeting(x + 17 * image_xscale, y, Solid);

if(falling && wasnt_wall && is_wall){
    hspd = 0;
    vspd = 0;
    
    // Move against the ledge
    while(!place_meeting(x + image_xscale, y, Solid)){
        x += image_xscale;
    }
    
    // Make sure we are the right height
    while(position_meeting(x + 17 * image_xscale, y - 1, Solid))
    {
        y -= 1;
    }
    
    sprite_index = spr_player_ledge_grab;
    state = ledge_grab_state;
}
