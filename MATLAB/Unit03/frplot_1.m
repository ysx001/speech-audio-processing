w = linspace(-4*pi, 4*pi, 5001);
H = (1-exp(-j*w))./(1-0.8*exp(-j*w));
subplot(2,1,1);
plot(w, abs(H));
subplot(2,1,2);
plot(w, angle(H));

w0 = 5;
Hw0 = (1-exp(-j*w0))./(1-0.8*exp(-j*w0));

s = abs(Hw0)
g = angle(Hw0)
