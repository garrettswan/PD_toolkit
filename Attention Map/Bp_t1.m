function Bubble_plot_t2t1


figure('Color',[1 1 1]);
hold on

maximum_size = 100;

x = [1:5];

y = [ NaN    0.6615    0.7394    0.7296    0.7273    0.7445    0.7589    0.7305 ; ...
    0.4547    0.6715    0.7333    0.7562    0.7637    0.7574    0.7304    0.7394 ; ...
    0.5165    0.7009    0.7498    0.7649    0.7407    0.7280    0.7577    0.7404 ; ...
    0.5781    0.6993    0.7131    0.7300    0.7353    0.7268    0.7618    0.7453 ; ...
    0.6358    0.7290    0.7446    0.7284    0.7207    0.7129    0.7671    0.7790 ];

y = round(y*100);

marker_edge_color = [0 0 0];
marker_face_color = [.75 .75 .75];
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

set(gca,'XTickLabel',['        '; sprintf('    0%c  ',char(176)); ...
    sprintf('   1-2 %c',char(176)); ...
    sprintf('   2-5 %c',char(176)); ...
    sprintf('  5-10 %c',char(176)); ...
    sprintf('10-13.7%c',char(176)); '        ']);

set(gca,'YTickLabel',[' '; '0';'1';'2';'3';'4';'5';'6';'8';' ']);

% Change axis labels
ylabel_var = ylabel('Lag');
xlabel_var = xlabel('Spatial Separation');
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
% set(ylabel_var,'Rotation',0,'Position',[-.85 3 1]);
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

