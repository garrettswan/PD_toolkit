function PD_hists(data)

figure('Color',[1 1 1]);
hold on

if nargin == 0
    
    sigma = 20;
    height = .1;
    
    count = 0;
    for i = 1:10000
        if i == 801
            count = 0; 
        end
        
        count = count + 1;
        data_1(count) = normrnd(0,sigma);
        
         if i > 800
            data_2(count) = randi(360)-180;
         end
    end
end

color = [0 0 0];
linestyle = '-';
line_size = 2;

marker_edge_color = [1 0 0];
marker_face_color = [1 1 1];
marker = 'o';
scatter_size = 50;

x = -180:180;


for i = 1:100000

   if i > (100000*height)
       pdf_x(i) = randi(360)-180;
   else
       pdf_x(i) = normrnd(0,sigma);
   end
   
end

[n xout] = hist([data_1 data_2],-180:5:180);
[n_2 xout_2] = hist(pdf_x,-180:1:180);

plot(xout_2,n_2/max(n_2),...
    'LineWidth',line_size, ...
    'Color',color, ...
    'LineStyle',linestyle);

freq = n/max(n);

scatter(xout(freq~=0),freq(freq~=0),scatter_size, ...
    'MarkerEdgeColor',marker_edge_color,...
    'MarkerFaceColor',marker_face_color,...
    'Marker',marker);

end

