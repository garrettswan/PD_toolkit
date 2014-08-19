function [data] = batchanalysis

subs = [1:4];

for subnum = subs;
    
    fname = sprintf('subj%d.mat',subnum);

    
    
    eval(sprintf('load %s',fname))
    
    keyboard
    
    for stimuli = [1 3]
        for block = [2 3]
            data.error(subnum,stimuli,block,:) = block_data(block).error(block_data(block) == stimuli);
        end
    end
    
    
    
    
end

