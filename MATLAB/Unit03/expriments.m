
% Effects on changing N for butterworth
N=10; Wn=0.5; [B,A]=butter(N,Wn); frplot(A,B,501,8000);
N=100; Wn=0.5; [B,A]=butter(N,Wn); frplot(A,B,501,8000);

% Effects on changing Wn for butterworth
N=100; Wn=0.5; [B,A]=butter(N,Wn); frplot(A,B,501,8000);
N=100; Wn=0.8; [B,A]=butter(N,Wn); frplot(A,B,501,8000);

% 
