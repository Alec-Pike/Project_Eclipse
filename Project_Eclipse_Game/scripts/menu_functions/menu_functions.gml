///@param _options array 2D array; for each subarray, 
/// index 0 is the text to display and index 1 is the 
/// function to call. Do not include parenthesis on 
/// index 1.
function Menu(_x, _y, _options, _description = -1){
    with(instance_create_depth(_x, _y, -999, menu_Object)) {
        options = _options;
        description = _description;
        optionsCount = array_length(_options);
        hovermarker = "> ";
        
        // set up size
        margin = 25;
        draw_set_font(fSilver);
        if global.betweenRounds {
            margin /= 2;
            draw_set_font(fSilverHUD);
        }
        
        
        width = 1;
        if (_description != -1) {
            width = max(width, string_width(_description));
        }
        for (var i = 0; i < optionsCount; i++) {
            width = max(width, string_width(_options[i][0]));
        }
        width += string_width(hovermarker);
        
        heightLine = 70;
        if global.betweenRounds {
            heightLine /= 2;
        }
        
        height = heightLine * (optionsCount + !(_description == -1));
        
        widthFull = width + margin * 2;
        heightFull = height + margin * 2;
    }
}