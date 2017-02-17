function Y=differequ(A,B,X)
%DIFFEREQU Difference equation solver. 
%   Y = DIFFEREQU(A,B,X) solves the difference equation defined by
%   coefficient vectors A and B for input signal vector X according to
%
%       A(1)*Y(n) = B(1)*X(n) + B(2)*X(n-1) + ... + B(LB)*X(n-LB+1)
%                             - A(2)*Y(n-1) - ... - A(LA)*Y(n-LA+1)
%
%   with LA = LENGTH(A), LB = LENGTH(B), and n = 1...LENGTH(X).

%   Copyright (c) 2017 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 07-Feb-2017 $

%   File History/Comments:
%   created   07-Feb-2017 19:18:26
%             on MATLAB 7.14.0.739 (R2012a) for MACI64
%   modified  (N/A)

% format the input vectors
X = X(:);
B = B(:)/A(1); %NOTE: compute B vector first to ensure the integrity
A = A(:)/A(1);

% initalize the output
N = length(X);
Y = zeros(N ,1);

LA = length(A);
LB = length(B);

% loop through all output samples
for n = 1: N;
    for j = 2 : LA;
        if ((n-j+1) > 0);
            Y(n) = Y(n) - (A(j) * Y(n-j+1));
        end
    end
    for i = 1 : LB;
        if ((n-i+1) > 0)
            Y(n) = Y(n) + (B(i) * X(n-i+1));
        end
    end
end


