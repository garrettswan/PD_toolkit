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

if nargin < 2
    
    error('myApp:argChk', 'Wrong number of input arguments.')
    
elseif nargin == 2 %
    
    calculate_error = 0;
    data_error = 0;
    
elseif nargin == 3 || nargin == 4 % DATA and ERROR
    
    if (size(data_error,1) ~= size(y,1)) || (size(data_error,2) ~= size(y,2))
        
        calculate_error = 1;
        
        if sum([size(data_error,1) size(data_error,2)]) > 2
            error('myApp:argChk', 'Error dimension is not in the correct dimensions')
        end
    else
        calculate_error = 0;
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
        
        case 1
            color = [0 0 0];
            linestyle = '-';
            marker = 'o';
            line_size = 2;
        case 2
            color = [1 0 0];
            linestyle = '-';
            marker = 'o';
            line_size = 2;
    end
    
    if calculate_error
        
        switch data_error
            case 1 % calculating standard error
                if size(y{which_cond},2) > 1
                    
                end
                
            case 2 % calculating standard deviation
                data_error = std(y{which_cond});
            case 3 % calculating confidence 95% confidence interval
                
        end
        
    else
        if sum(sum(sum(data_error{which_cond}))) ~=0
            
        end
    end
    
    if data_error{which_cond} ~= 0
        if data_error_type == 1
            
            errorbar(x{which_cond},y{which_cond},data_error{which_cond},'LineWidth',line_size,'Marker',marker,'Color',color,'LineStyle',linestyle);
            
        elseif data_error_type == 2
            
            for whichpoint = 1:length(x{which_cond})
                if whichpoint < length(x{which_cond})
                    
                    ave_error = mean([data_error{which_cond}(whichpoint) data_error{which_cond}(whichpoint+1)]);
                    
                    a = [x{which_cond}(whichpoint);x{which_cond}(whichpoint);x{which_cond}(whichpoint+1);x{which_cond}(whichpoint+1)];
                    b = [y{which_cond}(whichpoint)+ave_error;y{which_cond}(whichpoint)-ave_error; ...
                        y{which_cond}(whichpoint+1)-ave_error;y{which_cond}(whichpoint+1)+ave_error];
                    
                    patch(a,b,color,'FaceAlpha',.25,'EdgeColor',[1 1 1]);
                    
                end
            end
        end
    end
    
    
    
    plot(x{which_cond},y{which_cond},'LineWidth',line_size,'Marker',marker,'Color',color,'LineStyle',linestyle);

end

box off
set(gca,'YLim',[0 1])
set(gca,'XLim',[min(x{1})-1 max(x{1})+1])
%set(gca,'XTick',[1 2 3 4 5 6 7])

xlims = get(gca,'XLim');
ylims = get(gca,'YLim');

line([0 max(x{1})+1],[ylims(2) ylims(2)],'Color',[0 0 0], 'LineWidth', 1.5);
line([max(x{1})+1 max(x{1})+1],ylims,'Color',[0 0 0], 'LineWidth', 1.5);





end

