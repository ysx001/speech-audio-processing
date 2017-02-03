function x=bumpfun(t)
%BUMPFUN Bump function implementation. 
%   X = BUMPFUN(T) returns the values of a bump function, i.e. for each
%   index n into array T we have:
%   
%                 |  exp(T(n)^2/(T(n)^2-1))   for |T(n)|  < 1.0
%         X(n) = <    
%                 |  0.0                      for |T(n)| >= 1.0
%
%   Function BUMPFUN operates in an element-by-element fashion on arrays T.
%   The dimensions of array X match the dimensions of array T.
%
%   EXAMPLE: t=linspace(-2,2,3001); tt=linspace(-2,2,37);
%            plot(t,bumpfun(t),'b',tt,bumpfun(tt),'r.');
%            axis([-2 2 -0.2 1.2 ]); grid on;
%            title('The Bump Function');
%            xlabel('t'); ylabel('bumpfun(t)');
%   
%   See also sincfun, stepfun, and bellfun.

%   Copyright (c) 2015 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 22-Nov-2015 $

%   File History/Comments:
%   created   22-Nov-2015 14:26:24
%             on MATLAB 7.14.0.739 (R2012a) for MACI64
%   modified  (N/A)

% generate the output array
x=zeros(size(t)); idx=(abs(t)<1);
x(idx)=exp(1+1./(t(idx).^2-1));