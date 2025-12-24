function total_distance_meters = calculateDistance(pos_data)
    if height(pos_data) < 2
        total_distance_meters = 0;
        return;
    end

    R = 6371e3; % Earth's radius in meters
    lat = deg2rad(pos_data.latitude);
    lon = deg2rad(pos_data.longitude);
    
    dLat = diff(lat);
    dLon = diff(lon);
    
    a = sin(dLat/2).^2 + cos(lat(1:end-1)) .* cos(lat(2:end)) .* sin(dLon/2).^2;
    c = 2 * atan2(sqrt(a), sqrt(1-a));
    
    distance_segments = R * c;
    total_distance_meters = sum(distance_segments);
end