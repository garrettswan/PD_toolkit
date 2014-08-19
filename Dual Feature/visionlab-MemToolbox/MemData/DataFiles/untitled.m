

for count = 1:1000
a = 0;
n = 1;
compound = 30;

banana = randperm(100);

for subject = 1
n = n + compound;
a(subject) = std(data.errors(banana(n:n+n)));

stand_a(subject,count) = a(subject);

end


end
