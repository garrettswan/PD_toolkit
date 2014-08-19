function Plot_memtoolbox

addpath(genpath('visionlab-MemToolbox'))

plot_reduced_data = 1;
plot_full_data = 0;
save_plots = 0; % note: each new figure overwrites the previous

% Direction first, surprise = 26
plot_group_1_pre = 1;
plot_group_1_post_d = 1;
plot_group_1_post_c = 1;

% Direction first, surprise = 11
plot_group_2_pre = 1;
plot_group_2_post_d = 1;
plot_group_2_post_c = 1;

% Direction only
plot_group_3 = 1;

% Color first, surprise = 26
plot_group_4_pre = 0;
plot_group_4_post_d = 0;
plot_group_4_post_c = 0;

% Color first, surprise = 11
plot_group_5_pre = 0;
plot_group_5_post_d = 0;
plot_group_5_post_c = 0;

% Color only
plot_group_6 = 0;

title_size = 30;
title_weight = 'Bold';
label_size = 20;
axis_size = 20;
font = 'Arial';
parameter_size = 20;
parameter_x_loc = 75; %in degrees, is constant
parameter_sigma_y_loc = .25; % proportion from bottom relative to max y
parameter_pm_y_loc = .175; % proportion from bottom relative to max y

if plot_reduced_data == 1
    load Reduced_trial_data
elseif plot_all_data == 1
    
end

if plot_group_1_pre
    PlotData(data(1).magic.pre_magic_direction_error);
    
    tvar = title('Group 1 - Pre surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(1).group_data.pre_d))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(1).group_data.pre_dg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it

    if save_plots
        eval(printcommand)
    end
end

if plot_group_1_post_d
    PlotData(data(1).magic.post_magic_direction_error);
    
    tvar = title('Group 1 - Post surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(1).group_data.post_d))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(1).group_data.post_dg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_1_post_c
    PlotData(data(1).magic.post_magic_color_error);
    
    tvar = title('Group 1 - Pre surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(1).group_data.post_c))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(1).group_data.post_cg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_2_pre
    PlotData(data(2).magic.pre_magic_direction_error);
    
    tvar = title('Group 2 - Pre surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(2).group_data.pre_d))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(2).group_data.pre_dg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_2_post_d
    PlotData(data(2).magic.post_magic_direction_error);
    
    tvar = title('Group 2 - Post surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(2).group_data.post_d))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(2).group_data.post_dg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_2_post_c
    PlotData(data(2).magic.post_magic_color_error);
    
    tvar = title('Group 2 - Post surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(2).group_data.post_c))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(2).group_data.post_cg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_3
    PlotData(data(3).magic.pre_magic_direction_error);
    
    tvar = title('Group 3 - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(3).group_data.pre_d))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(3).group_data.pre_dg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_4_pre
    PlotData(data(4).magic.pre_magic_color_error);
    
    tvar = title('Group 1 - Pre surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(4).group_data.pre_c))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(4).group_data.pre_cg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it

    if save_plots
        eval(printcommand)
    end
end

if plot_group_4_post_d
    PlotData(data(4).magic.post_magic_direction_error);
    
    tvar = title('Group 4 - Post surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(4).group_data.post_d))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(4).group_data.post_dg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_4_post_c
    PlotData(data(4).magic.post_magic_color_error);
    
    tvar = title('Group 4 - Pre surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(4).group_data.post_c))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(4).group_data.post_cg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_5_pre
    PlotData(data(5).magic.pre_magic_color_error);
    
    tvar = title('Group 5 - Pre surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(5).group_data.pre_c))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(5).group_data.pre_cg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_5_post_d
    PlotData(data(5).magic.post_magic_direction_error);
    
    tvar = title('Group 5 - Post surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(5).group_data.post_d))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(5).group_data.post_dg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_5_post_c
    PlotData(data(5).magic.post_magic_color_error);
    
    tvar = title('Group 5 - Post surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(5).group_data.post_c))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(5).group_data.post_cg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end

if plot_group_6
    PlotData(data(6).magic.pre_magic_color_error);
    
    tvar = title('Group 3 - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data(6).group_data.pre_c))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data(6).group_data.pre_cg))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'pd_test';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
end


end

