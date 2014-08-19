function new_color_circle(line_plot)

if nargin == 0
    line_plot = 1;
end

cform = makecform('lab2srgb');

L = 90;
a = 20;
b = 38;

radius = 60;

for i = 1:360
    
    [x y] = pol2cart(deg2rad(i),radius);
    
    x = x+a;
    y = y+b;
    
    rgb(i,:) = applycform([L x y],cform)*255;
    
end

if line_plot == 1
    color = flipud((rgb)./255);
    
    for i = 1:360
        color_i = i*((2*pi)/360);
        
        line([color_i color_i],[0 2],'Color',color(i,:),'LineWidth',2);
        hold on
    end
end


keyboard


end