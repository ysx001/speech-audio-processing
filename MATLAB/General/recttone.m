function S=recttone(F,FS,LEN,PHASE)
%RECTTONE Generates a rectangularly shaped tone. 
%   S = RECTTONE(F,FS,LEN,PHASE) generates signal vector S that represents
%   the samples of a rectangularly shaped tone with frequency F in [Hz] and
%   duration LEN in [sec]. Parameter FS determines the assumed underlying
%   sampling frequency in [Hz]. Parameter PHASE is an optional argument
%   that allows an explicit specification of a phase shift. Parameter
%   PHASE defaults to zero if omitted.
%
%   EXAMPLE: FS=8000; S=recttone(440,FS,0.5,pi/4);
%            sound(0.9*S,FS);
%   
%   See also SINETONE and TENTTONE.

%   Copyright (c) 2017 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 19-Jan-2017 $

%   File History/Comments:
%   created   19-Jan-2017 16:30:30
%             on MATLAB 7.14.0.739 (R2012a) for MACI64
%   modified  (N/A)

% check for optional parameter
if nargin<4; PHASE=0; end

% determine the number of samples
N=floor(LEN*FS);

% generate the output vector
S=sign(sin(2*pi*(F/FS)*(0:N-1).'+PHASE));