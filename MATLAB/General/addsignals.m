function [Z,NZ]=addsignals(X,NX,Y,NY)
%ADDSIGNALS Addition of two discrete-time signal vectors. 
%   [Z,NZ] = ADDSIGNALS(X,NX,Y,NY) adds the two signal vectors X and Y to
%   produce a summation signal vector Z. The first sample in vector X, i.e.
%   X(1), is assumed to be time aligned with sample count NX. The first
%   sample in vector Y, i.e. Y(1), is assumed to be time aligned with
%   sample count NY. The first sample in the resulting vector Z, i.e. Z(1),
%   is time aligned with sample count NZ. Vectors X and Y do not need to be
%   of the same length and do not need to start with the same sample counts
%   NX and NY. Samples outside of the range provided by X and Y are assumed
%   to be zero. Sample counts must be integer valued.
%
%   EXAMPLE: X=[ 1 1 1 1 1 1 1 1 1 1 ]; NX=-1; MX=+8;
%            Y=[ 2 3 4 -4 -3 -2 -1 ];   NY=+5; MY=+11;
%            [Z,NZ]=addsignals(X,NX,Y,NY); MZ=NZ+length(Z)-1;
%            subplot(2,1,1); h=stem(NX:MX,X); hold on;
%            set(h,'Color',[1 0 0],'Marker','*');
%            h=stem(NY:MY,Y); hold off;
%            set(h,'Color',[0 0.5 0],'Marker','s');
%            legend('Signal X','Signal Y'); title('Input Signals');
%            axis([NZ-0.5 MZ+0.5 -6 +6]); grid on;
%            subplot(2,1,2);
%            h=stem(NZ:MZ,Z); set(h,'Color','b');
%            legend('Signal Z=X+Y'); title('Output Signal');
%            axis([NZ-0.5 MZ+0.5 -6 +6]); grid on;
%   
%   See also TIMEALIGN.

%   Copyright (c) 2017 by Robert M. Nickel
%   $Revision: 1.0 $
%   $Date: 19-Jan-2017 $

%   File History/Comments:
%   created   19-Jan-2017 11:14:05
%             on MATLAB 7.14.0.739 (R2012a) for MACI64
%   modified  (N/A)

% make sure both input vectors are column vectors
X=X(:); Y=Y(:);

% find the end sample counts of each vector
MX=length(X)+NX-1; MY=length(Y)+NY-1;

% find the start and end sample counts for Z
NZ=min(NX,NY); MZ=max(MX,MY);

% initialize a zero padded vector for X and Y
ZX=zeros(MZ-NZ+1,1); ZY=ZX;

% place vectors X and Y into their correct location within ZX and ZY
ZX(NX-NZ+1:MX-NZ+1)=X; ZY(NY-NZ+1:MY-NZ+1)=Y;

% compute the output vector
Z=ZX+ZY;
