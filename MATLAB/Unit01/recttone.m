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

% check for optional parameter

t = [0:1/FS:LEN];
if nargin<4; PHASE=0; end
S = sin(2*pi*F*t+PHASE);
S(S>0) = 1; S(S<=0) = -1;

