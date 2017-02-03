function x=dirifun(n,t)
%DIRIFUN Dirichlet function implementation.
%   X = DIRIFUN(N,T) returns the values of the Dirichlet function of
%   order N, i.e. for each index n into array T we have:
%     
%                    |  (-1)^(k*(N+1))                 for T(n) = 2*pi*k 
%            X(n) = <                                  with integer k
%                    |  sin(N*T(n)/2)/(N*sin(T(n)/2))  otherwise
%
%   Function DIRIFUN operates in an element-by-element fashion on arrays T.
%   The dimensions of array X match the dimensions of array T.
%
%   EXAMPLE: t=linspace(-3*pi,3*pi,3001); tt=linspace(-3*pi,3*pi,61);
%            subplot(211); plot(t,dirifun(7,t),'b',tt,dirifun(7,tt),'r.');
%            axis([-3*pi 3*pi -1.2 1.2 ]); grid on;
%            title('The Dirichlet Function of Order 7');
%            xlabel('t'); ylabel('dirifun(7,t)');
%            subplot(212); plot(t,dirifun(8,t),'b',tt,dirifun(8,tt),'r.');
%            axis([-3*pi 3*pi -1.4 1.2 ]); grid on;
%            title('The Dirichlet Function of Order 8');
%            xlabel('t'); ylabel('dirifun(8,t)');
%   
%   See also sincfun, coscfun, and bellfun.

%   Copyright (c) 2015 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 23-Nov-2015 $

%   File History/Comments:
%   created   23-Nov-2015 22:01:23
%             on MATLAB 7.14.0.739 (R2012a) for MACI64
%   modified  (N/A)

% evaluate the denominator and compute the index sets
x=sin(t/2); idx1=(abs(x)<100*eps); idx2=(abs(x)>=100*eps);

% compute the non-singular cases
x(idx2)=sin((n/2)*t(idx2))./(n*x(idx2));

% consider all singular cases
k=round(t(idx1)/(2*pi)); x(idx1)=(-1).^(k*(n+1));
