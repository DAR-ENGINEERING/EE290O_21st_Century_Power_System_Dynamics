function convs = load_convs(case_name)
% First column of M_loads is bus index, second is resistance, third is conductance at each bus

case_dir = 'cases';
load_file = sprintf('%s/%s/conv_data.csv',case_dir,case_name);

try
    convs = csvread(load_file, 1,1);
catch
    warning('No convs file data was able to be loaded');
    convs = [];
end
