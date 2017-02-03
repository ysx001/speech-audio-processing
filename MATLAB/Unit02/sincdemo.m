function sincdemo(x)
%SINCDEMO Sinc interpolation demo. 
%   SINCDEMO(X) displays an interpolation demo for the (real) samples 
%   in vector X. X is an optional argument.

%   Copyright (c) 2001 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 05-Nov-2001 $

%   File History/Comments:
%   created   05-Nov-2001 10:30:33 on MATLAB 5.3.1.29215a (R11.1) for PCWIN
%   modified  (N/A)

% check for default example
if nargin<1; x=[ 1 3 3.5 4 5 -3 2 ]; end;
x=real(x);

% pad signal with zeros
t1=-3; t2=length(x)+2; t=t1:t2; x=[ 0 0 0 x(:).' 0 0 0 ]; Q=length(x);

% number of interpolation points
N=20;

% length of sinc vector
L=2*Q;

% generate the sinc vector
st=pi*linspace(0,L,N*L+1); sv=sin(st(2:end))./st(2:end);
sv=[ fliplr(sv) 1 sv ]; sQ=0:N*(Q-1); Qsv=linspace(t1,t2,length(sQ));

% allocate space for basis
S=zeros(Q,length(sQ));

% loop through the elements of the x vector
for n=0:Q-1; S(n+1,:)=x(n+1)*sv(N*L+1+sQ-N*n); end; ST=sum(S);

% compute normalization for axes
a=min(ST); b=max(ST); y1=a-0.2*(b-a); y2=b+0.2*(b-a);

% display the results
figure('NumberTitle','off','Name','ELEC 473 - SINC INTERPOLATION DEMO');

% display the signal
plot(Qsv,ST,'b-'); hold on;
h=line([t1 t2],[0 0]); set(h,'Color','k');
axis([t1 t2 y1 y2]); title('Analog Signal');

% display message
xlabel('Hit any key to continue...');
pause

% display sampling
stem(t,x,'r'); title('Sampling Procedure'); pause; hold off;

% diplay sampling only
stem(t,x,'r'); h=line([t1 t2],[0 0]); set(h,'Color','k');
axis([t1 t2 y1 y2]); title('Sampling Procedure');
xlabel('Hit any key to continue...');
pause;

% display the reconstruction procedure
for n=3:Q-2;
   stem(t,x,'r'); h=line([t1 t2],[0 0]); set(h,'Color','k');
   axis([t1 t2 y1 y2]); title('Reconstruction Procedure'); hold on;
   plot(Qsv,S(n,:),'g-'); plot(Qsv,ST,'k:');
   plot(Qsv,sum(S(1:n-1,:)),'m-');
   % display message
   xlabel('Hit any key to continue...'); pause; hold off;
end

% display overall result
stem(t,x,'r'); h=line([t1 t2],[0 0]); set(h,'Color','k');
axis([t1 t2 y1 y2]); title('Final Result'); hold on; plot(Qsv,ST,'b-');
for n=3:Q-2; plot(Qsv,S(n,:),'g-'); end; hold off

 