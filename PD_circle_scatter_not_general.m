function PD_circle_scatter_not_general

figure
hold on

maximum_size = 100;

x = [1:5];

y = [75 55 65 70 75; ...
    65 50 65 70 75; ...
    75 57 63 72 79; ...
    80 70 83 86 89; ...
    85 72 80 81 85];

for which_x = x
    
    y_count = 0;
    
    for which_y = y(which_x,:)
        
        y_count = y_count + 1;

        scatter_size = (which_y/maximum_size)*2000;

        scatter(which_x,y_count,scatter_size,'k');
        
        text(which_x,y_count,num2str(y(which_x,y_count)));
        
    end

    xlim([0 6])
    ylim([0 6])
end


end

