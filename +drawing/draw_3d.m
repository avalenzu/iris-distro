function h = draw_3d(A,b,C,d,obstacles,lb,ub)
  import iris.drawing.drawPolyFromVertices;
  
  h = figure(2);
  cla
  hold on
  for j = 1:length(obstacles)
    drawPolyFromVertices(obstacles{j},'k','FaceAlpha',0.5);
  end
  V = lcon2vert(A, b);
  drawPolyFromVertices(V', 'r');
  th = linspace(0,2*pi,20);
  y = [cos(th);sin(th);zeros(size(th))];
  for phi = linspace(0,pi,10)
    y = [y, axis2rotmat([1,0,0,phi])*y];
  end
  x = bsxfun(@plus, C*y, d);
  drawPolyFromVertices(x, 'b', 'FaceAlpha', 1)
  xlim([lb(1),ub(1)])
  ylim([lb(2),ub(2)])
  zlim([lb(3),ub(3)])
  camtarget(0.5*(lb+ub))
  campos([lb(1)-2,lb(2)-2,ub(3)])
%   axis off;
end