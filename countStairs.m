function flights_climbed = countStairs(position_data)
%for app

    if height(position_data) < 2 || ~ismember('altitude', position_data.Properties.VariableNames)
        flights_climbed = 0;
        return;
    end

    altitude = position_data.altitude;
    
    %smoothening the data
    altitude_smoothed = smoothdata(altitude, 'gaussian', 10);
    
    min_altitude = min(altitude_smoothed);
    max_altitude = max(altitude_smoothed);
    
    total_ascent_meters = max_altitude - min_altitude;
    
    meters_per_flight = 3; 
    
    flights_climbed = floor(total_ascent_meters / meters_per_flight);
end