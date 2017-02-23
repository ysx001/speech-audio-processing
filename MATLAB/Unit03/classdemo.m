FS=8000; f1=400; f2=500;
X1=sinetone(f1,FS,1,0); X2=sinetone(f2,FS,1,0);

X = X1 + X2;
fc = 450;

% experiment with butter filter
Wn = fc*2 /FS;
N = 10;
[B,A] = butter(N, Wn);

frplot(A,B,5001, FS);
subplot(2,1,1); hold on;
plot(f1*[1 1], [-1.1 1.1], 'g');
plot(f2*[1 1], [-1.1 1.1], 'r');
hold off;

% experiment with elliptic filter
% Wn = fc*2 /FS;
N = 5;
Rp_Lev = 0.96;
Rs_Lev = 0.04; % largest value of ripple

% change them into decible values
Rp = -20*log10(Rp_Lev);
Rs = -20*log10(Rs_Lev);
[B,A] = ellip(N,Rp,Rs,Wn);

frplot(A,B,5001, FS);
subplot(2,1,1); hold on;
plot(f1*[1 1], [-1.1 1.1], 'g');
plot(f2*[1 1], [-1.1 1.1], 'r');
hold off;
return

% [B,A] = butter(N, Wn);
% 
% Y=differequ(A,B,X);
% 
% soundsc(X1+X2, FS);