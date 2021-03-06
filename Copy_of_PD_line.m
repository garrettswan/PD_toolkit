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

    data_error = 0;

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
    total_conds = 1;

    a = x;
    b = y;
    c = data_error;

    x = [];
    y = [];
    data_error = [];

    x{1} = a;
    y{1} = b;
    data_error{1} = c;

end

figure('Color',[1 1 1])
hold on

for which_cond = 1:total_conds

    switch which_cond

        %% Change figure parameters here
        case 1 % First set of data
            color = [0 0 0]; % 1 is the maximum, RGB
            marker_edge_color = [1 1 1]; % change this to [1 1 1] to make the lines not touch the markers
            marker_face_color = [0 0 0];
            linestyle = '-';
            marker = 'o';
            marker_size = 7*2; % multiple by 2 to make the lines not touch the markers
            line_size = 2;

        case 2 % Second set of data
            color = [1 0 0];
            marker_edge_color = [1 0 0]; % change this to [1 1 1] to make the lines not touch the markers
            marker_face_color = [1 0 0];
            linestyle = '-';
            marker = 'o';
            marker_size = 7; % multiple by 2 to make the lines not touch the markers
            line_size = 2;
    end

    if data_error{which_cond} ~= 0
        if data_error_type == 1 % Regular error bars

            errorbar(x{which_cond},y{which_cond},data_error{which_cond},...
                'LineWidth',line_size, ...
                'Marker',marker, ...
                'Color',color, ...
                'LineStyle',linestyle, ...
                'MarkerEdgeColor' , marker_edge_color, ...
                'MarkerFaceColor' , marker_face_color, ...
                'MarkerSize'      , marker_size);

        elseif data_error_type == 2 % Fancy somewhat buggy error gradient

            how_many_points = length(x{which_cond})+((length(x{which_cond}))*2)-2;
            
            
            count = 0;
            for whichpoint = 1:how_many_points
                 if count < length(x{which_cond})
                
                
                if mod(whichpoint,3)==1 %top to right
                    count = count + 1;
                    ave_error = [data_error{which_cond}(count) data_error{which_cond}(count)*.9];
                    
                    this_x = x{which_cond}(count);
                    next_x = x{which_cond}(count)+.1;
                elseif mod(whichpoint,3)==2 % middle section
                    ave_error = [data_error{which_cond}(count)*.9 data_error{which_cond}(count)*.9];
                    
                    this_x = x{which_cond}(count)+.1;
                    next_x = x{which_cond}(count+1)+.9;
                    
                elseif mod(whichpoint,3)==0 % left to top
                    ave_error = [data_error{which_cond}(count)*.9 data_error{which_cond}(count+1)*.9];
                    
                    this_x = x{which_cond}(count+1)+.9;
                    next_x = x{which_cond}(count+1)+1;
                end
                    
                

                % ave_error = mean([data_error{which_cond}(whichpoint) data_error{which_cond}(whichpoint+1)]);

                    a = [this_x;this_x;next_x;next_x];
                    b = [y{which_cond}(count)+ave_error(1);y{which_cond}(count)-ave_error(1); ...
                        y{which_cond}(count+1)-ave_error(2);y{which_cond}(count+1)+ave_error(2)];

                    patch(a,b,color,'FaceAlpha',.25,'EdgeColor',[1 1 1]);

                 end
            end
        end
    end

    % Plots the data
    plot(x{which_cond},y{which_cond},...
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
set(gca,'YLim',[0 1]) 
set(gca,'XLim',[min(x{1})-1 max(x{1})+1])
set(gca,'XTick',x{1})

% Change axis labels
ylabel_var = ylabel('Proportion correct');
xlabel_var = xlabel('Lag');
title_var = title('Accuracy given lag');

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
    'YTick'             , 0:.1:1, ... %Determines the y axis values displayed in the format ymin:interval:ymax
    'LineWidth'         , 1.5);

% Important for getting rid of ticks on the top and right sides
xlims = get(gca,'XLim');
ylims = get(gca,'YLim');

line([0 max(x{1})+1],[ylims(2) ylims(2)],'Color',[0 0 0], 'LineWidth', 1.5);
line([max(x{1})+1 max(x{1})+1],ylims,'Color',[0 0 0], 'LineWidth', 1.5);

%Saves the graph as an .eps file, thus allowing alternate programs to
%sharpen the graph for publication.
filename = 'pd_test';

set(gcf, 'PaperPositionMode', 'auto');

printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
eval(printcommand)

end

