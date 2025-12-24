clearvars; clc; close all;
%for app
data_files = dir('*.mat');
if isempty(data_files)
    error('No .mat data files found in this folder.');
end

fingerprint_data = []; 
filenames = {};        

fprintf('Analyzing %d unlabeled data files...\n', length(data_files));
for i = 1:length(data_files)
    filename = data_files(i).name;
    load(filename);
    
    if exist('Acceleration', 'var') && ~isempty(Acceleration)
        [avg_mag, shakiness] = analyzeActivity(Acceleration);
        
        fingerprint_data = [fingerprint_data; avg_mag, shakiness];
        filenames{end+1} = filename;
    end
end
disp('Analysis Complete.');

% --- 2. Run K-Means Clustering ---
num_clusters = 3;
[cluster_idx, cluster_centers] = kmeans(fingerprint_data, num_clusters);

% --- 3. Interpret the Clusters ---
[~, sorted_indices] = sort(sum(cluster_centers.^2, 2));

activity_labels = strings(num_clusters, 1);
activity_labels(sorted_indices(1)) = "Low Activity (Sitting)";
activity_labels(sorted_indices(2)) = "Medium Activity (Walking)";
activity_labels(sorted_indices(3)) = "High Activity (Running/Stairs)";

% --- 4. Display the Segregated Results ---
fprintf('\n---=== Clustering Results ===---\n');
for i = 1:length(filenames)
    assigned_cluster = cluster_idx(i);
    assigned_label = activity_labels(assigned_cluster);
    fprintf('File: %-25s -> Cluster: %d (%s)\n', filenames{i}, assigned_cluster, assigned_label);
end

% --- 5. Visualize the Clusters ---
figure;
gscatter(fingerprint_data(:,1), fingerprint_data(:,2), cluster_idx, 'brg', 'o', 10);
hold on;
plot(cluster_centers(:,1), cluster_centers(:,2), 'kx', 'MarkerSize', 15, 'LineWidth', 3);

% --- FIX: Correct syntax for the legend ---
legend([activity_labels; 'Cluster Centers']);

title('Automatic Segregation of Unlabeled Data');
xlabel('Average Magnitude (Intensity)');
ylabel('Shakiness (Std Dev)');
grid on;