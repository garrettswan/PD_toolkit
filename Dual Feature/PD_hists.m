function PD_hists(data)

figure('Color',[1 1 1]);
hold on

if nargin == 0
    for i = 1:1000
        data(i) = normrnd(0,40);
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

pd = fitdist(data','normal');
pdf_dist = pdf(pd,x);

[n xout] = hist(data,-180:5:180);

plot(x,pdf_dist/max(pdf_dist),...
    'LineWidth',line_size, ...
    'Color',color, ...
    'LineStyle',linestyle);

freq = n/max(n);

scatter(xout(freq~=0),freq(freq~=0),scatter_size, ...
    'MarkerEdgeColor',marker_edge_color,...
    'MarkerFaceColor',marker_face_color,...
    'Marker',marker);

end

