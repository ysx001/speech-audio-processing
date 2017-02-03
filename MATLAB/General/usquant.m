function y=usquant(x,N)
%USQUANT Uniform scalar quantization between -1 and +1. 
%   Y = USQUANT(X,L) quantizes all values between -1 and +1 in X
%   into L uniformly spaced levels and returns the result in Y.

%   Copyright (c) 2008 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 08-Nov-2008 $

%   File History/Comments:
%   created   08-Nov-2008 18:14:15 on MATLAB 5.3.1.29215a (R11.1) for PCWIN
%   modified  (N/A)

% determine the scaling factors
a=N/2; b=(N+1)/2;

% deal with overflow and underflow case
x(x>=+1)=1-1/N; x(x<=-1)=1/N-1;

% compute the quantization result
y=(round(a*x+b)-b)/a;
