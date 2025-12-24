function total_seconds = calculateDuration(sensor_timetable)
%for app

    if ~istimetable(sensor_timetable) || height(sensor_timetable) < 2
        total_seconds = 0;
        return;
    end
    
    time_vector = sensor_timetable.Timestamp;
    
    duration_object = time_vector(end) - time_vector(1);
    total_seconds = seconds(duration_object);
end