function [ZX,ZY,NZ]=timealign(X,NX,Y,NY)
%TIMEALIGN Time alignment of two discrete-time signal vectors. 
%   [ZX,ZY,NZ] = TIMEALIGN(X,NX,Y,NY) zero pads the two signal vectors X
%   and Y to produce two time aligned signal vectors ZX and ZY. The first
%   sample in vector X, i.e. X(1), is assumed to be time aligned with
%   sample count NX. The first sample in vector Y, i.e. Y(1), is assumed
%   to be time aligned with sample count NY. The first sample in each of
%   the resulting vectors ZX and ZY, i.e. ZX(1) and ZY(1), are time aligned
%   with sample count NZ. Vectors X and Y do not need to be of the same
%   length and do not need to start with the same sample counts NX and NY.
%   Samples outside of the range provided by X and Y are assumed to be
%   zero. Vectors ZX and ZY are column vectors of the same length. Sample
%   counts must be integer valued.
%
%   EXAMPLE: X=[ 1 2 3 ]; NX=-1;
%            Y=[ 3 2 1 ]; NY=+1;
%            [ZX,ZY,NZ]=timealign(X,NX,Y,NY);
%            MZ=NZ+length(ZX)-1;
%            [ ZX.' ; ZY.' ; NZ:MZ ]
%   
%   See also ADDSIGNALS.

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

% find the start and end sample counts for ZX and ZY
NZ=min(NX,NY); MZ=max(MX,MY);

% initialize the zero padded vectors for X and Y
ZX=zeros(MZ-NZ+1,1); ZY=ZX;

% place vectors X and Y into their correct location within ZX and ZY
ZX(NX-NZ+1:MX-NZ+1)=X; ZY(NY-NZ+1:MY-NZ+1)=Y;

