function Menu(_x, _y, _options, _description = -1){
    with(instance_create_depth(_x, _y, -999, menu_Object)) {
        options = _options;
        description = _description;
        optionsCount = array_length(_options);
        hovermarker = "> ";
        
        // set up size
        margin = 25;
        draw_set_font(fSilver);
        
        width = 1;
        if (_description != -1) {
            width = max(width, string_width(_description));
        }
        for (var i = 0; i < optionsCount; i++) {
            width = max(width, string_width(_options[i][0]));
        }
        width += string_width(hovermarker);
        
        heightLine = 70;
        height = heightLine * (optionsCount + !(_description == -1));
        
        widthFull = width + margin * 2;
        heightFull = height + margin * 2;
    }
}