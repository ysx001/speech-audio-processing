function frplot(A,B,N,FS)
%FRPLOT Frequency Response Plot. 
%   FRPLOT(A,B) plots the frequency response of a difference equation with
%   coefficient vectors A and B into a new figure window (see DIFFEREQU
%   for the details on A and B). The upper subplot in the resulting figure
%   contains the graph of the magnitude response between normalized
%   frequencies -pi [rad/sample] and +pi [rad/sample]. The lower subplot
%   contains the graph of the phase response between normalized frequencies
%   -pi [rad/sample] and +pi [rad/sample].
%   
%   FRPLOT(A,B,N) uses N sample points for the graph of the frequency
%   response between -pi [rad/sample] and +pi [rad/sample]. Parameter N
%   defaults to 501 if omitted.
%   
%   FRPLOT(A,B,N,FS) plots the frequency response not as a function of
%   normalized frequency in [rad/sample] but as a function of continuous
%   frequency in [Hz]. The assumed underlying sampling frequency of the
%   filtered signals is given by FS.  
%
%   EXAMPLE: N=10; Wn=0.5; [B,A]=butter(N,Wn); frplot(A,B,501,8000);
%   
%   See also DIFFEREQU and FILTER.

% deal with the optional parameters
if nargin<3; N=501; end
OmFlg=0; if nargin<4; FS=1; OmFlg=1; end

% make sure that the coefficient vectors are column vectors 
A=A(:);
B=B(:);

w = linspace(-pi, pi, N);
f = w.*FS./(2*pi);

x = exp(j*w);
N1 = length(A)
N2 = length(B)
denominator = polyval(A, x)./exp(j.*w*(length(A)-1));
numerator = polyval(B, x)./exp(j.*w*(length(B)-1));
H = numerator ./ denominator;

subplot(2,1,1);
h = plot(w, abs(H));
set(h,'Color',[1 0 0],'LineWidth',2)
axis([-4 4 -0.5 1.5]); grid on
title('Magnitude Response');

subplot(2,1,2);
h = plot(w, angle(H));
set(h,'Color',[0 0.5 0],'LineWidth',2)
axis([-4 4 -4 4]); grid on
title('Phase Response');





