function Plot_memtoolbox

addpath(genpath('visionlab-MemToolbox'))

plot_reduced_data = 1;

%plot_full_data = 0;

save_plots = 1; % note: each new figure overwrites the previous

% Direction first, surprise = 26
plot_group_1_pre = 0;
plot_group_1_post_d = 0;
plot_group_1_post_c = 0;

% Direction first, surprise = 11
plot_group_2_pre = 0;
plot_group_2_post_d = 0;
plot_group_2_post_c = 0;

plot_group_1_and_2_surprise = 0;

% Direction only
plot_group_3 = 0;

% Color first, surprise = 26
plot_group_4_pre = 0;
plot_group_4_post_d = 0;
plot_group_4_post_c = 0;

% Color first, surprise = 11
plot_group_5_pre = 0;
plot_group_5_post_d = 0;
plot_group_5_post_c = 0;

plot_group_4_and_5_surprise = 0;
plot_group_4_and_5_surprise_with_transformation = 0;

% Color only
plot_group_6 = 0;

% exp 2 stuff
plot_exp2_surprise = 1;

plot_exp2_pre = 0;
plot_exp2_post_c = 0;
plot_exp2_post_d = 0;


title_size = 30;
title_weight = 'Bold';
label_size = 20;
axis_size = 20;
font = 'Arial';
parameter_size = 20;
parameter_x_loc = 75; %in degrees, is constant
parameter_sigma_y_loc = .25; % proportion from bottom relative to max y
parameter_pm_y_loc = .175; % proportion from bottom relative to max y

load group_data
data_2 = load('Reduced_trial_data.mat');
data_3 = load('exp_2_magic_plus_group_4_5.mat');
data_4 = load('group_data_exp2_fixed31.mat');
data_5 = load('only_exp_2_data');


if plot_group_1_pre
    PlotData(data_2.data(1).magic.pre_magic_direction_error);
    
    tvar = title('Group 1 - Pre surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(1).group_data.pre_d))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(1).group_data.pre_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/1_pre_d';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_1_post_d
    PlotData(data_2.data(1).magic.post_magic_direction_error);
    
    tvar = title('Group 1 - Post surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(1).group_data.post_d))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(1).group_data.post_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/1_post_d';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_1_post_c
    PlotData(data_2.data(1).magic.post_magic_color_error);
    
    tvar = title('Group 1 - Post surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(1).group_data.post_c))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(1).group_data.post_cg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/1_post_c';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_2_pre
    PlotData(data_2.data(2).magic.pre_magic_direction_error);
    
    tvar = title('Group 2 - Pre surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(2).group_data.pre_d))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(2).group_data.pre_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/2_pre_d';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_2_post_d
    PlotData(data_2.data(2).magic.post_magic_direction_error);
    
    tvar = title('Group 2 - Post surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(2).group_data.post_d))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(2).group_data.post_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/2_post_d';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_2_post_c
    PlotData(data_2.data(2).magic.post_magic_color_error);
    
    tvar = title('Group 2 - Post surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(2).group_data.post_c))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(2).group_data.post_cg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/2_post_c';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_1_and_2_surprise
    
    PlotData([data_2.data(1).magic.during_magic_color_error data_2.data(2).magic.during_magic_color_error]);
    
    tvar = title('Group 1 and 2 - Surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(25.07)]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(1).group_data.post_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = 100']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/1_2_magic_c';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
    
end

if plot_group_3
    PlotData(data_2.data(3).magic.pre_magic_direction_error);
    
    tvar = title('Group 3 - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(3).group_data.pre_d))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(3).group_data.pre_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/3_pre_d';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_4_pre
    PlotData(data_2.data(4).magic.pre_magic_color_error);
    
    tvar = title('Group 4 - Pre surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(4).group_data.pre_c))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(4).group_data.pre_cg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/4_pre_c';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_4_post_d
    PlotData(data_2.data(4).magic.post_magic_direction_error);
    
    tvar = title('Group 4 - Post surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(4).group_data.post_d))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(4).group_data.post_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/4_post_d';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_4_post_c
    PlotData(data_2.data(4).magic.post_magic_color_error);
    
    tvar = title('Group 4 - Post surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(4).group_data.post_c))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(4).group_data.post_cg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/4_post_c';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_5_pre
    PlotData(data_2.data(5).magic.pre_magic_color_error);
    
    tvar = title('Group 5 - Pre surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(5).group_data.pre_c))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(5).group_data.pre_cg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/5_pre_c';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_5_post_d
    PlotData(data_2.data(5).magic.post_magic_direction_error);
    
    tvar = title('Group 5 - Post surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(5).group_data.post_d))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(5).group_data.post_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/5_post_d';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_5_post_c
    PlotData(data_2.data(5).magic.post_magic_color_error);
    
    tvar = title('Group 5 - Post surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(5).group_data.post_c))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(5).group_data.post_cg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/5_post_c';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_4_and_5_surprise
    
    PlotData([data_2.data(4).magic.during_magic_direction_error data_2.data(5).magic.during_magic_direction_error]);
    
    tvar = title('Group 4 and 5 - Surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(17.76)]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(1).group_data.post_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = 78']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/4_5_magic_d';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
    
end

if plot_group_4_and_5_surprise_with_transformation
    
    data_transform = [data_2.data(4).magic.during_magic_direction_error data_2.data(5).magic.during_magic_direction_error];
    
    for i = 1:length(data_transform)
        
        if data_transform(i) < -90
            
            data_transform(i) = 180+data_transform(i);
        end
        
        if data_transform(i) > 90
            data_transform(i) = data_transform(i)-180;
            
        end
        
    end
    
    PlotData(data_transform);
    
    tvar = title('Group 4 and 5 - Surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    %set(gca,'Xlim',[-90 90]);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(17.40)]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(1).group_data.post_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = 82']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_6
    
    PlotData(data_2.data(6).magic.pre_magic_color_error);
    
    tvar = title('Group 6 - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(6).group_data.pre_c))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(6).group_data.pre_cg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/6_pre_c';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
    
end

if plot_exp2_surprise
    
    PlotData(data_3.a);
    
    tvar = title('Exp 2. - Surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
   % sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data_4.group_data(4).pre_c))]);
   % pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data_4.group_data(4).pre_cg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    %set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/exp2_magic_d';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
    
end

if plot_exp2_pre
    
    PlotData(data_5.data(4).magic.pre_magic_color_error);
    
    tvar = title('Exp 2. - Pre Surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data_4.group_data(4).pre_c))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data_4.group_data(4).pre_cg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/exp2_pre_d';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
    
end

if plot_exp2_post_c
    
    PlotData(data_5.data(4).magic.post_magic_color_error);
    
    tvar = title('Exp 2. - Post Surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data_4.group_data(4).post_c))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data_4.group_data(4).post_cg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/exp2_post_c';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
    
end


if plot_exp2_post_d
    
    PlotData(data_5.data(4).magic.post_magic_direction_error);
    
    tvar = title('Exp 2. - Post Surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data_4.group_data(4).post_d))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data_4.group_data(4).post_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/exp2_post_d';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
    
end


end

