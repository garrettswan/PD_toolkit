function soemthing

load histos

figure

count = 0;
for ii = 1:2
    for jj = 1:5
        count = count + 1;
        
        subplot(2,5,count)
        
        if ii == 1
            thishist = T1histos{1,jj};
            which_target  = 'T1';
        elseif ii == 2
            thishist = T2histos{1,jj};
            which_target  = 'T2';
        end
        
        histmax = 400;
        
        histdata = find(thishist < histmax);
        histdata = thishist(histdata);
        
        
        [n xout] = hist(histdata,[20:20:histmax]);
        
        r1 = [20:20:histmax];
        r2 = r1+20;
        
        area_1 = min(600^2,pi*r1.^2);
        area_2 = min(600^2,pi*r2.^2);
        
        
        radius = 200;
        
        for(i = 1:length(r1))

            points = zeros(600,600);
            
            radius = r1(i);
            for (x = 1: 600)
                for(y = 1:600)
                    thisradius = sqrt((x-300)^2 +(y-300)^2);
                    if(thisradius <= radius)
                        points(x,y) =1;
                    end
                end
            end
            
            area_1(i) = sum(sum(points));
        end
        
        for(i = 1:length(r2))
            
            points = zeros(600,600);
            
            radius = r2(i);
            for (x = 1: 600)
                for(y = 1:600)
                    thisradius = sqrt((x-300)^2 +(y-300)^2);
                    if(thisradius <= radius)
                        points(x,y) =1;
                    end
                end
            end
            area_2(i) = sum(sum(points));
        end
        
        %area_1 = pi*r1.^2;
        %area_2 = pi*r2.^2;
        
        diff = area_2-area_1;
        
        normed_n = n./diff;

        bar(normed_n);
        title(sprintf('%s | Separation = %g',which_target,jj));
        xlim([0 length(normed_n)+1])
        
    end
end



keyboard





end



