function x=rectfun(t)
%RECTFUN Rect function implementation. 
%   X = RECTFUN(T) returns the values of the rect function, i.e. for each
%   index n into array T we have:
%   
%                              |  0.0   for |T(n)| > 0.5
%                      X(n) = <   0.5   for |T(n)| = 0.5 
%                              |  1.0   for |T(n)| < 0.5
%
%   Function RECTFUN operates in an element-by-element fashion on arrays T.
%   The dimensions of array X match the dimensions of array T.
%
%   EXAMPLE: t=linspace(-3,3,3001); tt=linspace(-3,3,37);
%            plot(t,rectfun(t),'b',tt,rectfun(tt),'r.');
%            axis([-3 3 -0.2 1.2 ]); grid on;
%            title('The Rect Function');
%            xlabel('t'); ylabel('rectfun(t)');
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
x=stepfun(t+0.5)-stepfun(t-0.5);