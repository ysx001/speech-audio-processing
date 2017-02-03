function x=intsine(t)
%INTSINE Integral sine function implementation. 
%   X = INTSINE(T) returns the values of the integral sine function, i.e.
%   for each index n into array T we have:
%   
%              X(n) = integral from 0 to T(n) of sin(t)/t dt 
%
%   Function INTSINE operates in an element-by-element fashion on arrays T.
%   The dimensions of array X match the dimensions of array T. Input
%   arguments T(n) are assumed to be real valued.
%
%   EXAMPLE: t=linspace(-20,20,3001); tt=linspace(-20,20,47);
%            plot(t,intsine(t),'b',tt,intsine(tt),'r.');
%            axis([-20 20 -2 2 ]); grid on;
%            title('The Integral Sine Function');
%            xlabel('t'); ylabel('intsine(t)');
%   
%   See also sincfun, stepfun, and tentfun.

%   Copyright (c) 2015 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 22-Nov-2015 $

%   File History/Comments:
%   created   22-Nov-2015 14:26:24
%             on MATLAB 7.14.0.739 (R2012a) for MACI64
%   modified  (N/A)

% issue a warning for non-real input arguments
if ~isreal(t);
  warning('INTSINE only operates on the real part of the input!');
  t=real(t);
end

% generate the index of nonzero entries
idx=(t~=0);

% generate the output array
x=zeros(size(t));

% compute the values of the integral sine
x(idx)=imag(expint(j*t(idx)))+(pi/2)*sign(t(idx));
