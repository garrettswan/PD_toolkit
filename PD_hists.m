function PD_hists(data)

figure('Color',[1 1 1]);
hold on

if nargin == 0
    for i = 1:1000
        data(i) = normrnd(0,40);
    end
end

x = -180:180;

pd = fitdist(data','normal');
pdf_dist = pdf(pd,x);

[n xout] = hist(data,-180:5:180);

plot(x,pdf_dist/max(pdf_dist));


freq = n/max(n);

scatter(xout(freq~=0),freq(freq~=0));



end

