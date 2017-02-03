function S2=srchange(S1,F1,F2)
%SRCHANGE Sampling Rate Conversion. 
%   S2 = SRCHANGE(S1,F1,F2) assumes that the samples in signal column
%   vector S1 were sampled with sampling frequency F1. Function SRCHANGE
%   computes an equivalent signal column vector S2 with an assumed sampling
%   frequency of F2. A waitbar figure is opened on the screen to display
%   the (sometimes slow) progress in the conversion calculations. SRCHANGE
%   performs resampling via an exact sinc-interpolation. If F2 is smaller
%   than F1 then an appropriate anti-aliasing filter is used to low-pass
%   filter the input prior to resampling. 
%
%   EXAMPLE: F1=16000; F2=8000;
%            S1=0.5*sinetone(400,F1,0.5)+0.5*sinetone(6000,F1,0.5);
%            S2=srchange(S1,F1,F2);
%            sound(S1,F1); pause; sound(S2,F2);

%   Copyright (c) 2017 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 30-Jan-2017 $

%   File History/Comments:
%   created   30-Jan-2017 19:49:10
%             on MATLAB 7.14.0.739 (R2012a) for MACI64
%   modified  (N/A)

% make sure the input signal is a column vector
S1=S1(:);

% check for the trivial case
if F1==F2; S2=S1; return; end

% TODO: whats going on here?
n = 0 : length(S1)-1; 
tend = n(end)/ F1;
t = 0 : 1/F2: tend;
N = length(t);
S2 = zeros(N, 1);

if F2 > F1;
    %%%%%%%%%%%%%%
    % UPSAMPLING %
    %%%%%%%%%%%%%%
    h = waitbar(0, 'Sampling rate change in progress...');
    counter = 0;
    for k = 1: N;
        % One way: S2(k) = sum( S1.* (sinc(t(k) * F1 - n)));
        S2(k) = sinc(t(k) * F1 - n) * S1;
        if (k > counter + N/100);
            counter = k;
            waitbar(k/N);
        end
    end
    close(h);
else
    %%%%%%%%%%%%%%%%
    % DOWNSAMPLING %
    %%%%%%%%%%%%%%%%
    h = waitbar(0, 'Sampling rate change in progress...');
    counter = 0;
    for k = 1: N;
        S2(k) = (F2/F1) * ((sinc(t(k)* F2 - ((F2/F1)*n))) * S1);
        if (k > counter + N/100);
            counter = k;
            waitbar(k/N);
        end
    end
    close(h);
end