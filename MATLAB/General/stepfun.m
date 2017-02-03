function x=stepfun(t)
%STEPFUN Step function implementation. 
%   X = STEPFUN(T) returns the values of the step function, i.e. for each
%   index n into array T we have:
%   
%                              |  0.0   for T(n)<0
%                      X(n) = <   0.5   for T(n)=0 
%                              |  1.0   for T(n)>0
%
%   Function STEPFUN operates in an element-by-element fashion on arrays T.
%   The dimensions of array X match the dimensions of array T.
%
%   EXAMPLE: t=linspace(-3,3,3001); tt=linspace(-3,3,37);
%            plot(t,stepfun(t),'b',tt,stepfun(tt),'r.');
%            axis([-3 3 -0.2 1.2 ]); grid on;
%            title('The Step Function');
%            xlabel('t'); ylabel('stepfun(t)');
%   
%   See also sincfun, rectfun, and tentfun.

%   Copyright (c) 2015 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 22-Nov-2015 $

%   File History/Comments:
%   created   22-Nov-2015 14:26:24
%             on MATLAB 7.14.0.739 (R2012a) for MACI64
%   modified  (N/A)

% generate the output array
x=(t>0)+0.5*(t==0);