function Bubble_plot_t2t1


figure('Color',[1 1 1]);
hold on

maximum_size = 100;

x = [1:5];

y = [NaN	0.6406	0.2511	0.5819	0.5616	0.6629	0.6811	0.7423; ...
0.5041	0.3594	0.4983	0.6191	0.6303	0.6997	0.7035	0.7397; ...
0.5595	0.4548	0.5117	0.5320	0.5575	0.7184	0.7194	0.7596; ...
0.5927	0.4199	0.4212	0.4960	0.5489	0.6505	0.6748	0.7551; ...
0.6618	0.3209	0.3723	0.4545	0.5490	0.6863	0.6847	0.7274];

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
title_var = title('T2|T1');

% Change font of labels
set([xlabel_var , ylabel_var], ...
    'fontsize'        , 18 );

set([title_var], ...
    'fontsize'        , 22, ...
    'fontweight'      , 'b');

set([title_var, xlabel_var, ylabel_var], 'FontName','Arial');

set(gca,'FontSize',14);

% Rotate y label
set(ylabel_var,'Rotation',0,'Position',[-.85 3 1]);

% Move GCA over such that y label is in FOV
set(gca,'PlotBoxAspectRatioMode','manual')
set(gca,'Position',[.2 .11 .775 .815])

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

