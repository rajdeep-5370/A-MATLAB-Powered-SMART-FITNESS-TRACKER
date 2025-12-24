% Main Script for Testing from a FILE
clearvars; clc; close all;


filename_to_test = 'Sitting_soumadeep.mat'; 
user_weight_kg = 70; 

fprintf('--- Running Analysis on: %s ---\n', filename_to_test);


if ~isfile(filename_to_test)
    error('File not found: %s.', filename_to_test);
end
load(filename_to_test); 

if exist('Acceleration', 'var') && exist('Position', 'var') && ~isempty(Acceleration) && ~isempty(Position)
    

    [avg_mag, shakiness] = analyzeActivity(Acceleration);
    
    if contains(filename_to_test, 'Stairs', 'IgnoreCase', true)
        detected_mode = 'stairs';
    elseif shakiness > 2.0 
        detected_mode = 'running';
    elseif avg_mag < 1.0 && shakiness < 0.5 
        detected_mode = 'stabilized';
    else
        detected_mode = 'walking';
    end
    

    session_duration_sec = calculateDuration(Acceleration); 
    [step_count, height_used, prom_used] = Steps_Count(Acceleration, detected_mode);
    total_distance = calculateDistance(Position);
    flights_climbed = countStairs(Position);

    [calories_burned, met_value] = calculateCalories(detected_mode, session_duration_sec, user_weight_kg);
    

    fprintf('--> Activity Detected: %s (MET Value: %.1f)\n', detected_mode, met_value);
    
    mins = floor(session_duration_sec / 60);
    secs = rem(session_duration_sec, 60);
    fprintf('Session Duration: %d min, %.0f sec\n', mins, secs);
    
    fprintf('Total Steps:      %d steps\n', step_count);
    fprintf('Total Distance:   %.1f meters\n', total_distance);
    fprintf('Flights Climbed:  %d flights\n', flights_climbed);
    fprintf('Calories Burned:  %.1f kcal\n', calories_burned);
    

    visualiseSteps(Acceleration, height_used, prom_used);
    plotRouteMap(Position, total_distance);
    
else
    fprintf('Error: Missing or empty Acceleration/Position data in %s.\n', filename_to_test);
end