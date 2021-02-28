% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
  output_precision(15);
  n = rows(points);
  points = reorder_by_x(points);
  centroids = reorder_by_x(centroids);
  NC = rows(centroids);
  Data = zeros(1,n); 
  colour = hsv(NC); % iau primele NC culori din HSV
  for i = [1:n]
    v = zeros(1,NC);
    for j =[1:NC]
       v(j) = norm(points(i,:)-centroids(j,:));
    endfor
   [~,Data(i)] = min(v);
   % pentru fiecare punct calculez centroid-ul corespunzator
    scatter3(points(i,1),points(i,2),points(i,3),"MarkerFaceColor",colour(Data(i),:));
    % se adauga punctele cu o culoare corespunzatoare;
    hold all; 
  endfor
  view(-30,10);
endfunction

