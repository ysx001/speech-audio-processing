
% % Effects on changing N for butterworth
% %1
% N=5; Wn=0.5; [B,A]=butter(N,Wn); frplot(A,B,501,8000);
% %2
% N=10; Wn=0.5; [B,A]=butter(N,Wn); frplot(A,B,501,8000);
% %3
% N=100; Wn=0.5; [B,A]=butter(N,Wn); frplot(A,B,501,8000);
% 
% % Effects on changing Wn for butterworth
% %4
% N=10; Wn=0.3; [B,A]=butter(N,Wn); frplot(A,B,501,8000);
% %5
% N=10; Wn=0.5; [B,A]=butter(N,Wn); frplot(A,B,501,8000);
% %6
% N=10; Wn=0.8; [B,A]=butter(N,Wn); frplot(A,B,501,8000);
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % RpLev - pass-band ripple level
% % Effects on changing N for cheby1
% %7
% N = 5; Wn = 0.5; RpLev = 0.8;
% RpdB =-20*log(RpLev); [B, A] = cheby1(N, RpdB, Wn);
% frplot(A,B,501,8000);
% 
% %8
% N = 10; Wn = 0.5; RpLev = 0.8;
% RpdB =-20*log(RpLev); [B, A] = cheby1(N, RpdB, Wn);
% frplot(A,B,501,8000);
% 
% % Effects on changing Wn for cheby1
% %9
% N = 5; Wn = 0.5; RpLev = 0.8;
% RpdB =-20*log(RpLev); [B, A] = cheby1(N, RpdB, Wn);
% frplot(A,B,501,8000);
% 
% %10
% N = 5; Wn = 0.8; RpLev = 0.8;
% RpdB =-20*log(RpLev); [B, A] = cheby1(N, RpdB, Wn);
% frplot(A,B,501,8000);

% % Effects on changing RpLev for cheby1
% %11
% N = 5; Wn = 0.5; RpLev = 0.8;
% RpdB =-20*log(RpLev); [B, A] = cheby1(N, RpdB, Wn);
% frplot(A,B,501,8000);
% 
% %12
% N = 5; Wn = 0.5; RpLev = 0.5;
% RpdB =-20*log(RpLev); [B, A] = cheby1(N, RpdB, Wn);
% frplot(A,B,501,8000);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Effects on changing RsLev for cheby2
%13
N = 10; Wn = 0.5; RpLev = 0.2;
RpdB =-20*log(RpLev); [B, A] = cheby2(N, RpdB, Wn);
frplot(A,B,501,8000);

%14
N = 10; Wn = 0.5; RpLev = 0.5;
RpdB =-20*log(RpLev); [B, A] = cheby2(N, RpdB, Wn);
frplot(A,B,501,8000);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %15
% N=10; Wn=0.5; RpLev=0.95; RsLev=0.05; RpdB=-20*log10(RpLev);
% RsdB=-20*log10(RsLev); [B,A]=ellip(N,RpdB,RsdB,Wn);
% frplot(A,B,501,8000);
