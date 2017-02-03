function x=bellfun(t)
%BELLFUN Gaussian bell function implementation. 
%   X = BELLFUN(T) returns the values of the Gaussian bell function, i.e.
%   for each index n into array T we have:
%   
%                      X(n) = exp(-0.5*T(n)^2)/sqrt(2*pi) 
%
%   Function BELLFUN operates in an element-by-element fashion on arrays T.
%   The dimensions of array X match the dimensions of array T.
%
%   EXAMPLE: t=linspace(-3,3,3001); tt=linspace(-3,3,37);
%            plot(t,bellfun(t),'b',tt,bellfun(tt),'r.');
%            axis([-3 3 -0.1 0.5 ]); grid on;
%            title('The Bell Function');
%            xlabel('t'); ylabel('bellfun(t)');
%   
%   See also sincfun, stepfun, and tentfun.

%   Copyright (c) 2015 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 22-Nov-2015 $

%   File History/Comments:
%   created   22-Nov-2015 14:26:24
%             on MATLAB 7.14.0.739 (R2012a) for MACI64
%   modified  (N/A)

% generate the output array
x=(1/sqrt(2*pi))*exp(-0.5*t.*t);