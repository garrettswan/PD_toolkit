function Plot_memtoolbox

addpath(genpath('visionlab-MemToolbox'))

save_plots = 1; % note: each new figure overwrites the previous

% exp 2 stuff
plot_exp2_surprise = 1;

plot_exp2_pre = 1;
plot_exp2_post_c = 1;
plot_exp2_post_d = 1;

plot_model_pre = 0;
plot_model_surprise = 0;
plot_model_post = 0;

title_size = 30;
title_weight = 'Bold';
label_size = 20;
axis_size = 20;
font = 'Arial';
parameter_size = 20;
parameter_x_loc = 75; %in degrees, is constant
parameter_sigma_y_loc = .25; % proportion from bottom relative to max y
parameter_pm_y_loc = .175; % proportion from bottom relative to max y

actual = load('batch_data_with_omissions');
load all_138_data

if plot_exp2_surprise
    
    PlotData(actual.data(4).group_data.magic_d_error);
    
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
    
    PlotData(actual.data(4).magic.pre_magic_color_error);
    
    tvar = title('Exp 2. - Pre Surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data.pre_c))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data.pre_cg))]);
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
    
    PlotData(actual.data(4).magic.post_magic_color_error);
    
    tvar = title('Exp 2. - Post Surprise - Color');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data.post_c))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data.post_cg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/exp2_post_c';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
   % ylim([0 .35])
    
    if save_plots
        eval(printcommand)
    end
    
end


if plot_exp2_post_d
    
    PlotData(actual.data(4).magic.post_magic_direction_error);
    
    tvar = title('Exp 2. - Post Surprise - Direction');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data.post_d))]);
    pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data.post_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/exp2_post_d';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
    
end

if plot_model_pre
    
    pre = load('pre_model');
    PlotData(pre.deviations);
    
    tvar = title('Pre_model');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    %sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data_4.group_data(4).post_d))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data_4.group_data(4).post_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    %set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/model_pre';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
    
end

if plot_model_surprise
    
    sur_1 = load('surprise_model_1');
    sur_2 = load('surprise_model_2');
    sur_3 = load('surprise_model_3');
    
    sur_3_deviations = rad2deg(wrap(deg2rad(sur_3.deviations+180)));

    PlotData([sur_1.deviations sur_2.deviations sur_3_deviations]);
    
    tvar = title('Model surprise');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    %sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data_4.group_data(4).post_d))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data_4.group_data(4).post_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    %set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/model_surprise';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
    
end

if plot_model_post
    
    post = load('post_model');
    PlotData(post.deviations);
    
    tvar = title('Post model');
    xvar = xlabel('Error (degrees)');
    yvar = ylabel('Probability');
    
    set([xvar yvar tvar],'FontName',font);
    set([tvar],'FontSize',title_size,'FontWeight',title_weight);
    set([xvar yvar],'FontSize',label_size);
    set(gca,'FontSize',axis_size);
    
    %sd = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_sigma_y_loc,['\sigma = ' num2str(nanmean(data_4.group_data(4).post_d))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ' num2str(1-nanmean(data_4.group_data(4).post_dg))]);
    %pm = text(parameter_x_loc,max(get(gca,'Ylim'))*parameter_pm_y_loc,['Pm = ']);
    %set([sd pm],'FontSize',parameter_size,'FontName',font);
    
    filename = 'Pics/model_post';
    set(gcf, 'PaperPositionMode', 'auto');
    printcommand = sprintf('print -depsc2 %s',filename);   %set up the command to output it
    
    if save_plots
        eval(printcommand)
    end
    
end


end

