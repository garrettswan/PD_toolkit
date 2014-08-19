function []= Graph_color(block_data)



count = 0;

for stimuli = [1 3]
    for block = [2 3]
        
        count = count +1;
        
        subplot(2,2,count)
        hist(block_data(block).error(block_data(block).setSize == stimuli),30)
        std_title = nanstd(block_data(block).error(block_data(block).setSize == stimuli));
        xlim([-180 180]);
        
        title([block stimuli std_title]);
        
        
    end
end



end

