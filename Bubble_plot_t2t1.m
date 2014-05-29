function Bubble_plot_t2t1


figure('Color',[1 1 1]);
hold on

maximum_size = 100;

x = [1:5];

y = [NaN	0.66012	0.23684	0.59867	0.58909	0.69045	0.71888	0.75583; ...
0.50093	0.35052	0.53151	0.63284	0.64253	0.72106	0.73389	0.75891; ...
0.56497	0.45344	0.52158	0.54442	0.6	0.73837	0.75728	0.81107; ...
0.62284	0.49171	0.47112	0.51372	0.52603	0.67302	0.70101	0.75405; ...
0.63543	0.3871	0.42197	0.48387	0.56934	0.68187	0.71212	0.74757];

y = round(y*100);

marker_edge_color = [0 0 0];
marker_face_color = [.5 .5 .5];
marker = 'o';
font_name = 'Arial';
font_size = 18;
font_weight = 'normal';
font_color = [0 0 0];
horizontal_alignment = 'center';

for which_x = x

    y_count = 0;

    for which_y = y(which_x,:)

        y_count = y_count + 1;

        if isnan(y(which_x,y_count))==0
        
        scatter_size = (pi*(which_y/maximum_size)^2)*1200;
        
        scatter(which_x,y_count,scatter_size, ...
            'MarkerEdgeColor',marker_edge_color,...
            'MarkerFaceColor',marker_face_color,...
            'Marker',marker);

        text(which_x,y_count,num2str(y(which_x,y_count)),...
            'FontName',font_name,...
            'FontWeight',font_weight,...
            'FontSize',font_size,...
            'Color',font_color,...
            'HorizontalAlignment',horizontal_alignment);

        end
    end
end

%% Global figure parameters
box off
set(gca,'YLim',[0 9])
set(gca,'XLim',[min(x)-1 max(x)+1])

set(gca,'XTickLabel',['    '; sprintf('  0%c',char(176)); ...
    sprintf('0-2%c',char(176)); ...
    sprintf('2-4%c',char(176)); ...
    sprintf('4-6%c',char(176)); ...
    sprintf(' >6%c',char(176)); '    ']);

set(gca,'YTickLabel',[' '; '0';'1';'2';'3';'4';'5';'6';'8';' ']);

% Change axis labels
ylabel_var = ylabel('Lag');
xlabel_var = xlabel('Eccentricity');
title_var = title('');

% Change font of labels
set([xlabel_var , ylabel_var], ...
    'fontsize'        , 18 );

set([title_var], ...
    'fontsize'        , 22, ...
    'fontweight'      , 'b');

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
    'YTick'             , 0:1:10, ... %Determines the y axis values displayed in the format ymin:interval:ymax
    'LineWidth'         , 1.5);

% Important for getting rid of ticks on the top and right sides
xlims = get(gca,'XLim');
ylims = get(gca,'YLim');

line([0 max(x)+1],[ylims(2) ylims(2)],'Color',[0 0 0], 'LineWidth', 1.5);
line([max(x)+1 max(x)+1],ylims,'Color',[0 0 0], 'LineWidth', 1.5);

%Saves the graph as an .eps file, thus allowing alternate programs to
%sharpen the graph for publication.
filename = 'pd_test';

set(gcf, 'PaperPositionMode', 'auto');

printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
eval(printcommand)

end

