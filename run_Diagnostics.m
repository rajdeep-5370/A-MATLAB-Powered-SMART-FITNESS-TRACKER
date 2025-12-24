% Classifier Diagnostics Tool

clearvars; clc; close all;


data_files = dir('*.mat');
num_files = length(data_files);

if num_files == 0
    error('No .mat data files found in this folder.');
end


fingerprint_table = table(); 

fprintf('Analyzing %d data files...\n', num_files);
for i = 1:num_files
    filename = data_files(i).name;
    load(filename);
    
    [avg_mag, shakiness] = analyzeActivity(Acceleration);
    

    if contains(filename, 'walk', 'IgnoreCase', true)
        activity_type = "Walking";
    elseif contains(filename, 'run', 'IgnoreCase', true)
        activity_type = "Running";
    elseif contains(filename, 'jog', 'IgnoreCase', true)
        activity_type = "Running";
    elseif contains(filename, 'stairs', 'IgnoreCase', true)
        activity_type = "Stairs";
    elseif contains(filename, 'sit', 'IgnoreCase', true)
        activity_type = "Sitting";
    else
        activity_type = "Unknown";
    end
    

    new_row = {activity_type, avg_mag, shakiness};
    fingerprint_table = [fingerprint_table; new_row];
end


fingerprint_table.Properties.VariableNames = {'Activity', 'AvgMag', 'Shakiness'};
disp('Analysis Complete. Fingerprints gathered:');
disp(fingerprint_table);


figure;
gscatter(fingerprint_table.AvgMag, fingerprint_table.Shakiness, fingerprint_table.Activity, 'brgkc', 'o', 10, 'on');
grid on;
xlabel('Average Magnitude (Intensity)');
ylabel('Shakiness (Std Dev)');
title('Activity Fingerprint Analysis');
legend('Location', 'best');

fprintf('\nThis plot shows the unique fingerprint of each activity.\n');
fprintf('Use this visual to define the best rules for your if/else logic in the main script.\n');