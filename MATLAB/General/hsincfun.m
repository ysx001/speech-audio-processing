function x=hsincfun(t)
%HSINCFUN Hyperbolic sinc function implementation. 
%   X = HSINCFUN(T) returns the values of the hyperbolic sinc function,
%   i.e. for each index n into array T we have:
%   
%                      |  1.0               for T(n) = 0
%              X(n) = <    
%                      |  sinh(T(n))/T(n)   otherwise
%
%   Function HSINCFUN operates in an element-by-element fashion on arrays T.
%   The dimensions of array X match the dimensions of array T.
%
%   EXAMPLE: t=linspace(-2,2,5001); tt=linspace(-2,2,61);
%            plot(t,hsincfun(t),'b',tt,hsincfun(tt),'r.');
%            axis([-2 2 -0.1 2.1 ]); grid on;
%            title('The Hyperbolic Sinc Function');
%            xlabel('t'); ylabel('hsincfun(t)');
%   
%   See also sincfun, coscfun, stepfun, and tentfun.

%   Copyright (c) 2015 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 22-Nov-2015 $

%   File History/Comments:
%   created   22-Nov-2015 14:26:24
%             on MATLAB 7.14.0.739 (R2012a) for MACI64
%   modified  (N/A)

% generate the output array
x=ones(size(t)); idx=(t~=0); x(idx)=sinh(t(idx))./t(idx);