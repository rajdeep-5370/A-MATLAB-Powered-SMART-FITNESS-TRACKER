function [avg_mag, shakiness] = analyzeActivity(accel_data)
    mag = sqrt(sum(accel_data{:,:}.^2, 2));
    
    avg_mag = mean(mag);
    shakiness = std(mag);
end