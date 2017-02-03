function x=sincfun(t)
%SINCFUN Sinc function implementation. 
%   X = SINCFUN(T) returns the values of the sinc function, i.e. for each
%   index n into array T we have:
%   
%                      |  1.0                      for T(n) = 0
%              X(n) = <    
%                      |  sin(pi*T(n))/(pi*T(n))   otherwise
%
%   Function SINCFUN operates in an element-by-element fashion on arrays T.
%   The dimensions of array X match the dimensions of array T.
%
%   EXAMPLE: t=linspace(-5,5,5001); tt=linspace(-5,5,61);
%            plot(t,sincfun(t),'b',tt,sincfun(tt),'r.');
%            axis([-5 5 -0.3 1.1 ]); grid on;
%            title('The Sinc Function');
%            xlabel('t'); ylabel('sincfun(t)');
%   
%   See also coscfun, stepfun, and tentfun.

%   Copyright (c) 2015 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 22-Nov-2015 $

%   File History/Comments:
%   created   22-Nov-2015 14:26:24
%             on MATLAB 7.14.0.739 (R2012a) for MACI64
%   modified  (N/A)

% generate the output array
x=ones(size(t)); idx=(t~=0); t=pi*t; x(idx)=sin(t(idx))./t(idx);