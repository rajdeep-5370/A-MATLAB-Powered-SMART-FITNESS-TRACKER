function [total_calories, met_value] = calculateCalories(mode, duration_seconds, body_weight_kg)
   %for app
    switch mode
        case 'running'
            met_value = 7.0;
        case 'stairs' 
            met_value = 5.0; 
        case 'walking'
            met_value = 3.5;
        case 'stabilized'
            met_value = 1.0;
        otherwise
            met_value = 3.5; 
    end

    duration_minutes = duration_seconds / 60;
    
    calories_per_minute = (met_value * body_weight_kg * 3.5) / 200;
    
    total_calories = calories_per_minute * duration_minutes;
end