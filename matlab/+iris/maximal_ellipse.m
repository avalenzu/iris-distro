function [C, d, volume] = maximal_ellipse(A,b)

[C, d] = iris.inner_ellipsoid.mosek_nofusion(A, b);

% If Mosek fails for you, you can use CVX with the free SDPT3 solver,
% but it will be much (about 100X) slower. Just swap the above line for the
% following:
% [C, d] = iris.inner_ellipsoid.cvx_ellipsoid(A, b);

volume = det(C);

