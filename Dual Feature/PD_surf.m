function PD_surf(x)
%PD_LINE is designed for line plots

range_1 = [140:180];
range_2 = [1:140];
range_3 = 2;
range_4 = 2;
range_5 = 1;

load dist_fitting_data_2_comp

out = x(range_1,range_2,range_3,range_4,range_5);
out(:,141:150,:,:,:) = nan;
out(:,151:290,:,:,:) = LL(range_1,1:140);

x = [];

x = out;

less_than_212 = find(x < -212);

x(less_than_212) = -212;

load dist_fitting_data

figure('Color',[1 1 1])
hold on

for which_cond = 1
    
    
    edgealpha = .01;
    edgecolor = [0 0 0];
    edgelighting = 'phong';
    
    % Plots the data
%     surf(x(range_1,range_2,range_3,range_4,range_5),...
%         'EdgeAlpha',edgealpha,...
%         'EdgeColor',edgecolor,...
%         'FaceLighting',edgelighting);
    
    surf(x,...
         'EdgeAlpha',edgealpha,...
         'EdgeColor',edgecolor,...
         'FaceLighting',edgelighting);

    light('Position',[10 10 40],'Style','infinite')

end

%% Global figure parameters
box off
set(gca,'YLim',[1 length(range_1)])
%set(gca,'XLim',[1 151])
set(gca,'XLim',[1 291])

%set(gca,'Xtick',1:30:151);
set(gca,'Xtick',1:30:291);

% set(gca,'XTickLabel',[...
%     'inf';...
%     '150'; ...
%     '120'; ...
%     '90 '; ...
%     '60 '; ...
%     '30 ']);

% set(gca,'XTickLabel',[...
%     'inf';...
%     '150'; ...
%     '120'; ...
%     '90 '; ...
%     '60 '; ...
%     '30 ']);

set(gca,'Ytick',1:10:max(range_2));
set(gca,'YTickLabel',[...
     '42';...
     '32';...
     '22';...
     '12';...
     '  ']); 

set(gca,'Zlim',[-215 -170]);
set(gca,'Ztick',[-210:10:-170]); 
set(gca,'ZTickLabel',[...
     '-220';...
     '-200';...
     '-190';...
     '-180';...
     '-170']);  

% Change axis labels
ylabel_var = ylabel('');
xlabel_var = xlabel('');
zlabel_var = zlabel('');
title_var = title('');

% Change font of labels
set([xlabel_var , ylabel_var , zlabel_var], ...
    'fontsize'        , 18 );

% Change font of title
set([title_var], ...
    'fontsize'        , 22, ...
    'fontweight'      , 'b'); % b = bold

set([title_var, xlabel_var, ylabel_var, zlabel_var], 'FontName','Arial');

set(gca,'FontSize',14);
view(-16,16);
%set(gca,'Position',[8 311 675 357])

%Defines the properties of the axes.
set(gca, ...
    'Box'               , 'off', ... %Turns the box on or off
    'TickDir'           , 'out', ... %Changes the direction of the tick marks
    'TickLength'        , [.02 .02], ... %Changes the length of the tick marks
    'XMinorTick'        , 'off', ...%Adds smaller tick marks between larger ones on the x axis
    'YMinorTick'        , 'off', ...%Adds smaller tick marks between larger ones on the y axis
    'YGrid'             , 'on', ... %Adds a thin grid to the y axis
    'XGrid'             , 'on',...
    'Zgrid'             , 'on', ...
    'XColor'            , [0 0 0], ... %Changes the color of the x axis
    'YColor'            , [0 0 0], ... %Changes the color of the y axis
    'LineWidth'         , 1.5);

% Important for getting rid of ticks on the top and right sides
xlims = get(gca,'XLim');
ylims = get(gca,'YLim');
zlims = get(gca,'Zlim');

% line([150 150],[1 1],zlims,'Color',[0 0 0], 'LineWidth', 1.5);
% line([150 150],[1 41],[-170 -170],'Color',[0 0 0], 'LineWidth', 1.5);
% line([0 150],[41 41],[-170 -170],'Color',[0 0 0], 'LineWidth', 1.5);

line([290 290],[1 1],zlims,'Color',[0 0 0], 'LineWidth', 1.5);
line([290 290],[1 41],[-170 -170],'Color',[0 0 0], 'LineWidth', 1.5);
line([0 290],[41 41],[-170 -170],'Color',[0 0 0], 'LineWidth', 1.5);


%Saves the graph as an .eps file, thus allowing alternate programs to
%sharpen the graph for publication.
filename = 'pd_test';

set(gcf, 'PaperPositionMode', 'auto');

printcommand = sprintf('print -dpdf -painters %s',filename);   %set up the command to output it
eval(printcommand)


end

