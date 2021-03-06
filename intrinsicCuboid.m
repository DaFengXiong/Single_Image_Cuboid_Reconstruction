function [w3 l M] = intrinsicCuboid(X)

%{
w= K^-T K^-1 

w =1     0  w3(1)
   0     1  w3(2)
w3(1) w3(2) w3(3) 
%}

% A * w3' + b = 0

A =[ ...
    X(3,1)*X(1,2)+X(1,1)*X(3,2), X(3,1)*X(2,2)+X(2,1)*X(3,2), X(3,1)*X(3,2); 
    X(3,1)*X(1,3)+X(1,1)*X(3,3), X(3,1)*X(2,3)+X(2,1)*X(3,3), X(3,1)*X(3,3);
    X(3,2)*X(1,3)+X(1,2)*X(3,3), X(3,2)*X(2,3)+X(2,2)*X(3,3), X(3,2)*X(3,3)];

b=[ ...
X(1,1)*X(1,2)+X(2,1)*X(2,2);
X(1,1)*X(1,3)+X(2,1)*X(2,3);
X(1,2)*X(1,3)+X(2,2)*X(2,3)];

w3 = A\b;



w = zeros(3,3);
w(:,3) = w3;
w(3,:) = w3'

LTL = X' * w * X

l = diag(LTL)
l = l/l(4)

% test
l = l.^0.5
M =  X * inv(diag(l))


% M = K[R|t]


% M =  X * inv(diag(l))

%invdiag(l)
% l = diag(LTL);
% l = l/l(4);
% 
% % M = K[R|t]
% 
% % X3x4 * L^-1
% 
% invdiag(l)

end 