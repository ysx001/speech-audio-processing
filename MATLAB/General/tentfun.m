function x=tentfun(t)
%TENTFUN Triangular function implementation. 
%   X = TENTFUN(T) returns the values of the triangular function, i.e. for
%   each index n into array T we have:
%   
%                         |  1 - |T(n)|   for   |T(n)| < 1
%                 X(n) = <   
%                         |  0            otherwise
%
%   Function TENTFUN operates in an element-by-element fashion on arrays T.
%   The dimensions of array X match the dimensions of array T.
%
%   EXAMPLE: t=linspace(-3,3,3001); tt=linspace(-3,3,37);
%            plot(t,tentfun(t),'b',tt,tentfun(tt),'r.');
%            axis([-3 3 -0.2 1.2 ]); grid on;
%            title('The Tent Function');
%            xlabel('t'); ylabel('tentfun(t)');
%   
%   See also sincfun, stepfun, and rectfun.

%   Copyright (c) 2015 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 22-Nov-2015 $

%   File History/Comments:
%   created   22-Nov-2015 14:26:24
%             on MATLAB 7.14.0.739 (R2012a) for MACI64
%   modified  (N/A)

% generate the output array
x=(1-abs(t)).*rectfun(t/2);