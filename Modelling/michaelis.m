x=0:0.1:30;
Km = 1;
vmax = 5
y=(vmax.*x)./(Km+x)

plot(x,y)
xlabel("Substrate concentration (mM)")
ylabel("Reaction rate (mM/s)")
title("Michealis Menten Equation")
