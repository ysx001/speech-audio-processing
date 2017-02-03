% Tester script for signal addition

% load a speech signal
[S,FS]=audioread('SpeechExample1.wav');
% play the speech signal
sound(0.8*S,FS); pause
% define the recursive delay time and amplitude change
DT=2000; AC=0.6;
% initialize the loop
X=S; TT=DT; AA=AC;
% reverberate the signal
for n=1:10; X=addsignals(X,0,AA*S,TT); TT=TT+DT; AA=AA*AC; end
% play the result
sound(0.8*X/max(X),FS)