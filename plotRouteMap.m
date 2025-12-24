function plotRouteMap(ui_axes, position_data, total_distance)
%for app
    axes(ui_axes);
    cla reset;

    if height(position_data) < 2 || ~ismember('speed', position_data.Properties.VariableNames)
        title(ui_axes, 'Not enough data to plot route');
        return;
    end

    lat = position_data.latitude;
    lon = position_data.longitude;
    speed_data = position_data.speed;
    
    scatter(ui_axes, lon, lat, 30, speed_data, 'filled');
    
    h = colorbar(ui_axes);
    ylabel(h, 'Speed (m/s)');
    colormap(ui_axes, 'jet');
    
    hold(ui_axes, 'on');
    plot(ui_axes, lon(1), lat(1), 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
    plot(ui_axes, lon(end), lat(end), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    hold(ui_axes, 'off');
    
    xlabel(ui_axes, 'Longitude');
    ylabel(ui_axes, 'Latitude');
    title_str = sprintf('Workout Route (%.1f m)', total_distance);
    title(ui_axes, title_str);
    grid(ui_axes, 'on');
    axis(ui_axes, 'equal');
end