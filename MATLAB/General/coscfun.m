function x=coscfun(t)
%COSCFUN Cosinc function implementation. 
%   X = COSCFUN(T) returns the values of the cosinc function, i.e. for each
%   index n into array T we have:
%     
%                    |  0.0                             for T(n) = 0
%            X(n) = <    
%                    |  (cos(pi*T(n))-sinc(T(n)))/T(n)  otherwise
%
%   Function COSCFUN operates in an element-by-element fashion on arrays T.
%   The dimensions of array X match the dimensions of array T.
%
%   EXAMPLE: t=linspace(-5,5,5001); tt=linspace(-5,5,61);
%            plot(t,coscfun(t),'b',tt,coscfun(tt),'r.');
%            axis([-5 5 -1.6 1.6 ]); grid on;
%            title('The Cosinc Function');
%            xlabel('t'); ylabel('coscfun(t)');
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
x=zeros(size(t)); idx=(t~=0); tt=pi*t; 
x(idx)=(cos(tt(idx))-sin(tt(idx))./tt(idx))./t(idx);
