% COLORWORKINGMEMORYEXPERIMENT Runs a color working memory task
% a la Zhang & Luck (2008). The task requires memory for the color of
% briefly presented squares. Participants then report the color of a single
% probed square using a continuous report task.
%
%   ColorWorkingMemoryExperiment();
%
%	Preferences can be found down at the bottom, beginning on line 197.
%

function ColorWorkingMemoryExperiment


subject = input('Subject Number: ','s');

if size(subject,1) == 0 && size(subject,2) == 0
    return
end

block_order_s = str2num(subject);

block_order_n = mod(block_order_s,2); %% this line is courtesy of Chris

if block_order_n == 0
    block_order = [1 2 3]; %%%% even subjects 
else
    block_order = [1 3 2]; %%%% odd subjects 
end
    




prepareEnvironment;
window = openWindow();

for block = 3%block_order
    
    
    %tic
    try
        
        prefs = getPreferences(block);
        
        % put up instructions and wait for keypress
        instruct(window,block);
        returnToFixation(window, window.centerX, window.centerY, prefs.fixationSize)
        
        WaitSecs(1);
        
        % get rects for items
        %     for i = 1:max(prefs.setSizes)
        %       rects{i} = circularArrayRects([0, 0, prefs.squareSize, prefs.squareSize], i, prefs.radius, window.centerX, window.centerY)';
        %     end
        %
        colorWheelLocations = colorwheelLocations(window,prefs);
        
        for trialIndex = 1:length(prefs.fullFactorialDesign)
            
            
            for i = 1:max(prefs.setSizes) %%%%%%%%%%%%%%%%
                
                rotation = randi(6)*30;  %%%%%%%%%%%
                
                rects{i} = circularArrayRects([0, 0, prefs.squareSize, prefs.squareSize], i, prefs.radius, window.centerX, window.centerY,rotation)';
            end
            
            
            % figure out how many items on this trial and the duration
            nItems = prefs.setSizes(prefs.fullFactorialDesign(prefs.order(trialIndex), 1));
            retentionInterval = prefs.retentionIntervals(prefs.fullFactorialDesign(prefs.order(trialIndex), 2));
            
            % pick item to test
            itemToTest(trialIndex) = RandSample(1:nItems);
            
            data.item_tested(trialIndex) = itemToTest(trialIndex);
            
            % pick colors for this trial
            colorsInDegrees{trialIndex} = ceil(rand(1,nItems)*360);
            
            % draw fixation
            drawFixation(window, window.centerX, window.centerY, prefs.fixationSize);
            
            
            
            % draw stimulus
            colorsToDisplay = prefs.colorwheel(colorsInDegrees{trialIndex}, :)';
            
            rectangle = rects{max(prefs.setSizes)};
            position = randi(3);
            
            n1_position = rectangle(:,position);
            
            perm_nItems = randperm(max(prefs.setSizes));
            
            data.seq_order(trialIndex) = perm_nItems(2);
            
            % for i = 1:nItems
            
            tic
            if nItems == 1
                
                %WaitSecs(prefs.
                
                Screen('FillRect', window.onScreen, colorsToDisplay, n1_position);
                
                drawFixation(window, window.centerX, window.centerY, prefs.fixationSize);
                Screen('Flip', window.onScreen);
                WaitSecs(prefs.stimulusDuration);
                
                
            else
                
                if block ~= 3
                    Screen('FillRect', window.onScreen, colorsToDisplay, rects{nItems});
                    
                    drawFixation(window, window.centerX, window.centerY, prefs.fixationSize);
                    Screen('Flip', window.onScreen);
                    WaitSecs(prefs.stimulusDuration);
                    
                    
                else
                    for i = 1:nItems
                        
                        Screen('FillRect', window.onScreen, colorsToDisplay(:,i), rectangle(:,perm_nItems(i)));
                        
                        drawFixation(window, window.centerX, window.centerY, prefs.fixationSize);
                        Screen('Flip', window.onScreen);
                        WaitSecs(prefs.stimulusDuration);
                        
                    end
                end
            end
            
            
            
            %position = rectangle(:,perm_nItems(i));
            % end
            
            guess_box = [window.screenX-100 window.screenY-100 window.screenX-30 window.screenY-30];  %%%%%%%%%%%%%%%%%%
            
            
            % remove stimulus, return to blank, wait for retention interval to pass
            returnToFixation(window, window.centerX, window.centerY, prefs.fixationSize);
            
            prefs.retentionIntervals = .1;
            
           
            if (block == 3 && nItems == 1) || block ~= 3 %to change duration for sim based on seq
                prefs.retentionIntervals = (prefs.stimulusDuration *((ceil(max(prefs.setSizes)/2))-1)) + .5;
                
            end
            
            WaitSecs(prefs.retentionIntervals);
            
            
            toc
            

            try
                
                
            if block == 3
                data.numberTested(trialIndex) = itemToTest(trialIndex);
            end
  
                
            % choose a circle to test, then display response screen
            data.presentedColor(trialIndex) = deg2rad(colorsInDegrees{trialIndex}(itemToTest(trialIndex)));
            colorsOfTest = repmat([75 75 75], nItems, 1); %120
            colorsOfTest(itemToTest(trialIndex), :) = [75 75 75]; % 145
            drawFixation(window, window.centerX, window.centerY, prefs.fixationSize);
            
            catch
             sca
            keyboard
            end
            
            if nItems ~= 1
                Screen('FillRect', window.onScreen, colorsOfTest', rects{nItems});
            else
                Screen('FillRect', window.onScreen, colorsOfTest', n1_position);
            end
            
            drawColorWheel(window, prefs);
            
            
            beginresponse = GetSecs;
            
            % wait for click
            
            SetMouse(window.centerX, window.centerY);
            ShowCursor('Arrow');
            
            % if mouse button is already down, wait for release
            [x,y,buttons] = GetMouse(window.onScreen);
            while any(buttons)
                [x,y,buttons] = GetMouse(window.onScreen);
            end
            
            everMovedFromCenter = false;
            while ~any(buttons) || everMovedFromCenter == false
                
                
                
                
                drawColorWheel(window, prefs);
                
                [x,y,buttons] = GetMouse(window.onScreen);
                [minDistance, minDistanceIndex] = min(sqrt((colorWheelLocations(1, :) - x).^2 + (colorWheelLocations(2, :) - y).^2));
                
                
                center_distance = sqrt((  window.centerX - x)^2 + (window.centerY - y)^2); %%%%%%%%%%%%
                
                if(center_distance > prefs.colorWheelRadius-10)
                    everMovedFromCenter = true;
                end
                
                if(everMovedFromCenter)
                    colorsOfTest(itemToTest(trialIndex), :) = prefs.colorwheel(minDistanceIndex,:);
                else
                    colorsOfTest(itemToTest(trialIndex), :) = [245 245 245];
                end
                
                drawFixation(window, window.centerX, window.centerY, prefs.fixationSize);
                
                if nItems ~= 1
                    Screen('FillRect', window.onScreen, colorsOfTest', rects{nItems});
                else
                    Screen('FillRect', window.onScreen, colorsOfTest', n1_position);
                end
                
                Screen('FillRect', window.onScreen, [125 125 125], guess_box');
                
                
                drawColorWheel(window, prefs);
                Screen('Flip', window.onScreen);
            end
            
            endresponse = GetSecs;
            
            data.reportedColor(trialIndex) = deg2rad(minDistanceIndex);
            data.responsetime(trialIndex) = endresponse-beginresponse;
            
            
            if(x < 10) && (y < 10)
                sca
                break
            end
            
            if (x > guess_box(1) && x < guess_box(3)) && (y > guess_box(2) && y < guess_box(4))
                data.reportedColor(trialIndex) = nan;
            end
            
            
            while any(buttons) % wait for release
                [x,y,buttons] = GetMouse(window.onScreen);
            end
            
            
            HideCursor
            
            % return to fixation
            returnToFixation(window, window.centerX, window.centerY, prefs.fixationSize);
            WaitSecs(0.5);
        end
        
        % initial analysis of results
        data.error = (180/pi) .* (angle(exp(1i*data.reportedColor)./exp(1i*data.presentedColor)));
        
        data.setSize = prefs.setSizes(prefs.fullFactorialDesign(prefs.order, 1));
        data.retentionInterval = prefs.retentionIntervals(prefs.fullFactorialDesign(prefs.order,2));
        
        block_data(block) = data;
        
        subject_num = str2num(subject);
        
        datadir='data/';
        
        
        filename = sprintf('%s%d',datadir,subject_num);
        save(filename,'block_data','prefs');
        
        
        
    catch
        postpareEnvironment;
        psychrethrow(psychlasterror);
        
    end % end try/catch
    
end % end whole colorworkingmemoryscript

postpareEnvironment;
%toc
end


function prepareEnvironment

clear all;
HideCursor;

commandwindow; % select the command window to avoid typing in open scripts

% seed the random number generator
RandStream.setDefaultStream(RandStream('mt19937ar','seed',sum(100*clock)));

ListenChar(2); % don't print to MATLAB command window
end

function postpareEnvironment
ShowCursor;
ListenChar(0);
Screen('CloseAll');
end

function instruct(window,block)
Screen('TextSize', window.onScreen, window.fontsize);

if block == 1
    Screen('DrawText',window.onScreen,'Practice Block',100, 100, 255);
else
    Screen('DrawText',window.onScreen,'Experiment Block',100, 100, 255);
end
Screen('DrawText', window.onScreen, 'Colored squares are going to appear around the center of the screen.', 100, 200, 255);
Screen('DrawText', window.onScreen, 'Your goal is to match one of the colors AS CLOSE AS POSSIBLE on a color wheel.', 100, 250, 255);
Screen('DrawText', window.onScreen, 'A white box will indicate which color you need to recall.', 100,300, 255);
Screen('DrawText', window.onScreen, 'If you have ABSOLUTELY no idea, click the gray box in the lower right corner.', 100, 350, 255);
Screen('DrawText', window.onScreen, 'Only click the gray box if you are COMPLETELY guessing.',100,400,255);
Screen('DrawText', window.onScreen, 'Click the left mouse button to begin',100,500,255);
Screen('Flip', window.onScreen);
GetClicks(window.onScreen);
end

function drawFixation(window, fixationX, fixationY, fixationSize)
Screen('DrawDots', window.onScreen, [fixationX, fixationY], fixationSize, 255);
end

function offsets = circularArrayOffsets(n, centerX, centerY, radius, rotation)
degreeStep = 360/n;
offsets = [sind([0:degreeStep:(360-degreeStep)] + rotation)'.* radius, cosd([0:degreeStep:(360-degreeStep)] + rotation)'.* radius];
end

function rects = circularArrayRects(rect, nItems, radius, centerX, centerY, rotation)
coor = circularArrayOffsets(nItems, centerX, centerY, radius,rotation) + repmat([centerX centerY], nItems, 1);
rects = [coor(:, 1)-rect(3)/2 , coor(:, 2)-rect(3)/2, coor(:, 1)+rect(3)/2, coor(:, 2)+rect(3)/2];
end

function returnToFixation(window, fixationX, fixationY, fixationSize)
Screen('FillRect', window.onScreen, window.bcolor);
Screen('DrawDots', window.onScreen, [fixationX, fixationY], fixationSize, 255);
Screen('Flip', window.onScreen);
end

function window = openWindow()
window.screenNumber = max(Screen('Screens'));
[window.onScreen rect] = Screen('OpenWindow', window.screenNumber, [50 50 50],[],[],[],[]); %original 128
Screen('BlendFunction', window.onScreen, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
[window.screenX, window.screenY] = Screen('WindowSize', window.onScreen); % check resolution
window.screenRect  = [0 0 window.screenX window.screenY]; % screen rect
window.centerX = window.screenX * 0.5; % center of screen in X direction
window.centerY = window.screenY * 0.5; % center of screen in Y direction
window.centerXL = floor(mean([0 window.centerX])); % center of left half of screen in X direction
window.centerXR = floor(mean([window.centerX window.screenX])); % center of right half of screen in X direction

% basic drawing and screen variables
window.black    = BlackIndex(window.onScreen);
window.white    = WhiteIndex(window.onScreen);
window.gray     = mean([window.black window.white]);
window.fontsize = 24;
window.bcolor   = [50 50 50]; %window.gray;
end

function drawColorWheel(window, prefs)
colorWheelLocations = [cosd([1:360]).*prefs.colorWheelRadius + window.centerX; ...
    sind([1:360]).*prefs.colorWheelRadius + window.centerY];
colorWheelSizes = 20;
Screen('DrawDots', window.onScreen, colorWheelLocations, colorWheelSizes, prefs.colorwheel', [], 1);
end

function L = colorwheelLocations(window,prefs)
L = [cosd([1:360]).*prefs.colorWheelRadius + window.centerX; ...
    sind([1:360]).*prefs.colorWheelRadius + window.centerY];
end

function prefs = getPreferences(block)

if block == 1
    prefs.nTrialsPerCondition = 2;
else
    prefs.nTrialsPerCondition = 10;
end


prefs.setSizes = [3];
prefs.retentionIntervals = 0;


prefs.stimulusDuration = 0.50;
prefs.squareSize = 75; % size of each stimulus object, in pixels
prefs.radius = 180;
prefs.fixationSize = 3;

% colorwheel details
prefs.colorWheelRadius = 350;
prefs.colorwheel = load('colorwheel360.mat', 'fullcolormatrix');
prefs.colorwheel = prefs.colorwheel.fullcolormatrix;

% randomize trial order of full factorial design order
prefs.fullFactorialDesign = fullfact([length(prefs.setSizes), ...
    length(prefs.retentionIntervals), ...
    prefs.nTrialsPerCondition]);

prefs.order = Shuffle(1:length(prefs.fullFactorialDesign));
prefs.nTrials = length(prefs.fullFactorialDesign);
end
