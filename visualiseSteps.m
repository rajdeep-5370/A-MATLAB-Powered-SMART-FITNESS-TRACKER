function visualiseSteps(ui_axes, accel_data, peak_height, peak_prominence)
%for app
    axes(ui_axes);
    cla reset;
    

    if isempty(accel_data)
        title(ui_axes, 'No acceleration data to visualize');
        return;
    end
    mag = sqrt(sum(accel_data{:,:}.^2, 2));


    [pks, locs] = findpeaks(mag, 'MinPeakHeight', peak_height, 'MinPeakProminence', peak_prominence);
    

    plot(ui_axes, mag);
    

    hold(ui_axes, 'on');
    

    plot(ui_axes, locs, pks, 'rv', 'MarkerFaceColor', 'r');
    

    hold(ui_axes, 'off');

    title_str = sprintf('Step Visualization (%d steps found)', numel(pks));
    title(ui_axes, title_str);
    xlabel(ui_axes, 'Data Samples');
    ylabel(ui_axes, 'Acceleration Magnitude');
    grid(ui_axes, 'on');
end