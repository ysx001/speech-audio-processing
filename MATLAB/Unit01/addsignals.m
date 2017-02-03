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

% make sure both input vectors are column vectors
[ZX,ZY,NZ]=timealign(X,NX,Y,NY)
Z = ZX + ZY;
X=X(:); Y=Y(:);
