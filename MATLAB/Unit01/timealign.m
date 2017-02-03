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

% make sure both input vectors are column vectors
X=X(:); Y=Y(:);
N = NX - NY;

if N <= 0
    ZX = X;
    ZY = [zeros(abs(N),1); Y];
    NZ = NX;
else
    ZX = [zeros(N,1);X];
    ZY = Y;
    NZ = NY;
end

Lx = length(ZX);
Ly = length(ZY);
L = Lx - Ly;

if L<0
    ZX = [ZX; zeros(abs(L), 1)];
    ZY = ZY;
else
    ZX= ZX;
    ZY = [ZY; zeros(L,1)];
end




