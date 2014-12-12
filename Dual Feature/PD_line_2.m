function PD_line
%PD_LINE is designed for line plots


load line_data

figure('Color',[1 1 1])
hold on

y(1,:) = direction_post_std;
y(2,:) = color_post_std;
y(3,:) = color_pre_std;


for which_cond = 1:3

    
    if which_cond < 2 % First set of data
            color = [0 0 1]; % 1 is the maximum, RGB
            marker_edge_color = [0 0 1]; % change this to [1 1 1] to make the lines not touch the markers
            marker_face_color = [0 0 1];
            linestyle = '-';
            marker = 'o';
            marker_size = 4; % multiple by 2 to make the lines not touch the markers
            line_size = 2;

    else % Second set of data
            color = [1 0 0];
            marker_edge_color = [1 0 0]; % change this to [1 1 1] to make the lines not touch the markers
            marker_face_color = [1 0 0];
            linestyle = '--';
            marker = 'o';
            marker_size = 4; % multiple by 2 to make the lines not touch the markers
            line_size = 4;
    end

    % Plots the data
    plot(1:50,y(which_cond,:),...
        'LineWidth',line_size, ...
        'Marker',marker, ...
        'Color',color, ...
        'LineStyle',linestyle, ...
        'MarkerEdgeColor' , marker_edge_color, ... 
        'MarkerFaceColor' , marker_face_color, ...
        'MarkerSize'      , marker_size); 
end

%% Global figure parameters
box off
set(gca,'YLim',[0 75]) 
set(gca,'XLim',[0 51])

% Change axis labels
ylabel_var = ylabel('Standard Deviation');
xlabel_var = xlabel('Trial');
title_var = title('Raw Standard Deviation per Trial');

% Change font of labels
set([xlabel_var , ylabel_var], ...
    'fontsize'        , 18 );

% Change font of title
set([title_var], ...
    'fontsize'        , 22, ...
    'fontweight'      , 'b'); % b = bold

set([title_var, xlabel_var, ylabel_var], 'FontName','Arial');

set(gca,'FontSize',14);

%Defines the properties of the axes.
set(gca, ...
    'Box'               , 'off', ... %Turns the box on or off
    'TickDir'           , 'out', ... %Changes the direction of the tick marks
    'TickLength'        , [.02 .02], ... %Changes the length of the tick marks
    'XMinorTick'        , 'off', ...%Adds smaller tick marks between larger ones on the x axis
    'YMinorTick'        , 'off', ...%Adds smaller tick marks between larger ones on the y axis
    'YGrid'             , 'off', ... %Adds a thin grid to the y axis
    'XColor'            , [0 0 0], ... %Changes the color of the x axis
    'YColor'            , [0 0 0], ... %Changes the color of the y axis
    'YTick'             , 0:20:60, ... %Determines the y axis values displayed in the format ymin:interval:ymax
    'LineWidth'         , 1.5);

% Important for getting rid of ticks on the top and right sides
xlims = get(gca,'XLim');
ylims = get(gca,'YLim');

line([0 51],[ylims(2) ylims(2)],'Color',[0 0 0], 'LineWidth', 1.5);
line([51 51],ylims,'Color',[0 0 0], 'LineWidth', 1.5);

%Saves the graph as an .eps file, thus allowing alternate programs to
%sharpen the graph for publication.
filename = 'pd_test';

set(gcf, 'PaperPositionMode', 'auto');

printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
eval(printcommand)

end

