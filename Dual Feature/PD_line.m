function PD_line(x,y,data_error,data_error_type)
%PD_LINE is designed for line plots



%   data_error = can be precomputed (which would need to be the same
%                dimension as data or can be computed within this function.
%         0 = no error bars
%         1 = standard error
%         2 = standard deviation
%         3 = 95% confidence intervals
%
%

if nargin == 0
    
    x{1} = 1:10;
    
    % Actual data
    y{1} = rand(1,10);
    
    data_error{1} = zeros(1,10)+(.2*rand(1,10)+.4)/10;
    
    % to show error bars, set to 1
    data_error_type = 2;
    
elseif nargin == 2 %
    
    data_error = [];
    
elseif nargin == 3 || nargin == 4 % DATA and ERROR
    
    if (size(data_error,1) ~= size(y,1)) || (size(data_error,2) ~= size(y,2))
        error('myApp:argChk', 'Error dimension is not in the correct dimensions')
    end
    
    if nargin==3
        data_error_type = 1;
    end
    
end

if iscell(x) == 1 || iscell(y) == 1
    total_conds = length(y);
else
    total_conds = length(y)+1;
end

figure('Color',[1 1 1])
hold on

for which_cond = 1:total_conds
    
    
    color = [.5 .5 .5]; % 1 is the maximum, RGB
    marker_edge_color = [1 1 1]; % change this to [1 1 1] to make the lines not touch the markers
    marker_face_color = [0 0 0];
    linestyle = '-';
    marker = 'none';
    marker_size = 7*2; % multiple by 2 to make the lines not touch the markers
    line_size = 1;
    
    
    if which_cond == 139
        
        x(:,139) = [1 2];
        y(:,139) = [11.8 14.1];
        data_error_fixed = [.3 .4];
        
        color = [1 0 0]; % 1 is the maximum, RGB
        marker_edge_color = [1 0 0]; % change this to [1 1 1] to make the lines not touch the markers
        marker_face_color = [1 0 0];
        linestyle = '-';
        marker = 'none';
        marker_size = 10; % multiple by 2 to make the lines not touch the markers
        line_size = 4;
        
        errorbar(x(:,which_cond),y(:,which_cond),data_error_fixed,...
            'LineWidth',line_size, ...
            'Marker',marker, ...
            'Color',color, ...
            'LineStyle',linestyle, ...
            'MarkerEdgeColor' , marker_edge_color, ...
            'MarkerFaceColor' , marker_face_color, ...
            'MarkerSize'      , marker_size);
    end
    
    
    % Plots the data
    plot(x(:,which_cond),y(:,which_cond),...
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
set(gca,'YLim',[0 30])
set(gca,'XLim',[min(min(x))-.25 max(max(x))+.25])
set(gca,'XTick',[1 2])

set(gca,'XTickLabel',['Pre-Critical '; ...
                      'Post-Critical']);

% Change axis labels
ylabel_var = ylabel('Standard Deviation (Degrees)');
xlabel_var = xlabel('');
title_var = title('Pre v Post');

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
    'YTick'             , 0:5:30, ... %Determines the y axis values displayed in the format ymin:interval:ymax
    'LineWidth'         , 1.5);

% Important for getting rid of ticks on the top and right sides
xlims = get(gca,'XLim');
ylims = get(gca,'YLim');

line([0 max(max(x))+.25],[ylims(2) ylims(2)],'Color',[0 0 0], 'LineWidth', 1.5);
line([max(max(x))+.25 max(max(x))+.25],ylims,'Color',[0 0 0], 'LineWidth', 1.5);

%Saves the graph as an .eps file, thus allowing alternate programs to
%sharpen the graph for publication.
filename = 'pd_test';

set(gcf, 'PaperPositionMode', 'auto');

printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
eval(printcommand)

end

