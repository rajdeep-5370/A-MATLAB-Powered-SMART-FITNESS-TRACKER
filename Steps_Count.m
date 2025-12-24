function [step_count, peak_height, peak_prominence] = Steps_Count(accel_data, mode)
    if height(accel_data) < 2
        step_count = 0; peak_height = 0; peak_prominence = 0;
        return;
    end

    mag = sqrt(sum(accel_data{:,:}.^2, 2));

    if strcmp(mode, 'running')
        peak_height = 3.0;
        peak_prominence = 2.5;
        mag_to_process = mag;

    elseif strcmp(mode, 'stairs')
        peak_height = 2.5;
        peak_prominence = 1.5;
        mag_to_process = mag;

    elseif strcmp(mode, 'stabilized')
        peak_height = 0.1;
        peak_prominence = 0.1;
        if numel(mag) > 20
            mag_to_process = mag - movmean(mag, 20);
        else
            mag_to_process = mag;
        end

    else % 'walking' case
        peak_height = 2.5;
        peak_prominence = 1.5;
        mag_to_process = mag;
    end
    
    [pks, ~] = findpeaks(mag_to_process, 'MinPeakHeight', peak_height, 'MinPeakProminence', peak_prominence);
    step_count = numel(pks);
end