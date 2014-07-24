function Bubble_plot_t1


figure_var = figure('Color',[1 1 1]);
hold on

maximum_size = 100;

x = [1:5];

y = [0.6408	0.7643	0.8045	0.7523	0.6982; ...
0.7362	0.7338	0.7537	0.7749	0.7193; ...
0.7608	0.7545	0.6978	0.6981	0.7340; ...
0.7022	0.7635	0.7438	0.7499	0.7386; ...
0.7522	0.8209	0.7900	0.7717	0.7632];

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
set(gca,'YLim',[0 6])
set(gca,'XLim',[min(x)-1 max(x)+1])

set(gca,'XTickLabel',['        '; sprintf('10 to 6%c',char(176)); ...
    sprintf(' 6 to 2%c',char(176)); ...
    sprintf('   0%c   ',char(176)); ...
    sprintf(' 2 to 6%c',char(176)); ...
    sprintf('6 to 10%c',char(176)); '        ']);

set(gca,'YTickLabel',['        '; sprintf('10 to 6%c',char(176)); ...
    sprintf(' 6 to 2%c',char(176)); ...
    sprintf('   0%c   ',char(176)); ...
    sprintf(' 2 to 6%c',char(176)); ...
    sprintf('6 to 10%c',char(176));'        ']);

% Change axis labels
ylabel_var = ylabel('Horizontal Position (relative to fixation)');
xlabel_var = xlabel('Vertical Position (relative to fixation)');
title_var = title('T1');

% Change font of labels
set([xlabel_var , ylabel_var], ...
    'fontsize'        , 18 );

set([title_var], ...
    'fontsize'        , 22, ...
    'fontweight'      , 'b');

set([title_var, xlabel_var, ylabel_var], 'FontName','Arial');

set(gca,'FontSize',14);

% % Rotate y label
% set(ylabel_var,'Rotation',0,'Position',[-1.5 3 1]);
% 
% % Move GCA over such that y label is in FOV
% set(gca,'PlotBoxAspectRatioMode','manual')
% set(gca,'Position',[.2 .11 .775 .815])

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
    'YTick'             , 0:1:6, ... %Determines the y axis values displayed in the format ymin:interval:ymax
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

