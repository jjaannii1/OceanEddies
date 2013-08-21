% Each is [latmin latmax lonmin lonmax]
northatlantic = [0 50 -80 0];
southatlantic = [-45 0 -50 10];
southafrica = [-80 -40 -5 45];
indian = [-45 20 40 120];
nepacific = [-5 50 -180 -110];
sepacific = [-60 0 -180 -65];
nwpacific = [0 60 120 180];
swpacific = [-60 5 120 180];

subset_data(ssh, lat, lon, dates, ...
    northatlantic(1), northatlantic(2), northatlantic(3), ...
    northatlantic(4), 'subsets/northatlantic');
subset_data(ssh, lat, lon, dates, ...
    southatlantic(1), southatlantic(2), southatlantic(3), ...
    southatlantic(4), 'subsets/southatlantic');
subset_data(ssh, lat, lon, dates, ...
    southafrica(1), southafrica(2), southafrica(3), ...
    southafrica(4), 'subsets/southafrica');
subset_data(ssh, lat, lon, dates, ...
    indian(1), indian(2), indian(3), ...
    indian(4), 'subsets/indian');
subset_data(ssh, lat, lon, dates, ...
    nepacific(1), nepacific(2), nepacific(3), ...
    nepacific(4), 'subsets/nepacific');
subset_data(ssh, lat, lon, dates, ...
    sepacific(1), sepacific(2), sepacific(3), ...
    sepacific(4), 'subsets/sepacific');
subset_data(ssh, lat, lon, dates, ...
    nwpacific(1), nwpacific(2), nwpacific(3), ...
    nwpacific(4), 'subsets/nwpacific');
subset_data(ssh, lat, lon, dates, ...
    swpacific(1), swpacific(2), swpacific(3), ...
    swpacific(4), 'subsets/swpacific');