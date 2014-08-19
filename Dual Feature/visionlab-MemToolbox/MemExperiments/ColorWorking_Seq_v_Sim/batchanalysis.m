function [data] = batchanalysis

subs = [6:7 9 12:16 18:34];

data.error = [];
directory = 'subjdata/';
total_nan = 0;

subj_index = 0;

for subnum = subs;
    
    subj_index = subj_index +1
    
    fname = sprintf('%s%d.mat',directory,subnum);

    eval(sprintf('load %s',fname))
    
    count = 0;
    
    stimuli_index = 0;
    
    for stimuli = [1 3]
        
        stimuli_index = stimuli_index +1;
        block_index = 0;
        for block = [2 3]
            
            block_index = block_index +1;

            data.error(:,stimuli_index,block_index,subj_index) = block_data(block).error(block_data(block).setSize == stimuli);
            
            count = count +1;

            total_nan(count) = sum(isnan(block_data(block).error(block_data(block).setSize == stimuli)));
                 
        end
    end

    data.Sim_one(subj_index,:) = nanstd(block_data(2).error(block_data(2).setSize == 1));
    data.Sim_three(subj_index,:) = nanstd(block_data(2).error(block_data(2).setSize == 3));
    data.Seq_one(subj_index,:) = nanstd(block_data(3).error(block_data(3).setSize == 1));
    data.Seq_three(subj_index,:) = nanstd(block_data(3).error(block_data(3).setSize == 3));
    data.total_nan(subj_index,:) = sum(total_nan);
    
    
    
end

