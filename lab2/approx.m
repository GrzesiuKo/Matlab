clear all
d = importdata('dane_apx0.mat');
%odczyt
x = d(:,1);
y = d(:,2);
n=2;
%a0+a1x
A = [ length(x),     sum(x), sum(x);
      sum(x),        sum(x.*x), sum(x.*x) ];
  
B = [ sum(y);
      sum(y.*x)];
  
a=A\B;
%a=polyfit(x,y,4);

%wyswietlenie punktow
figure, plot([0 1],[0 1],'w')
hold on
for k=1:length(x)
    plot(x(k),y(k),'r+')
end

punkty = 0:0.1:10;
aprox = a(1)+a(2).*punkty+a(3);

plot(punkty, aprox,'b')

hold off
