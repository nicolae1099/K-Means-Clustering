% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
	cost = 0;
  n = rows(points);
  NC = rows(centroids);
  for i = [1:n]
    v = zeros(1,NC);
    for j =[1:NC]
      v(j) = norm (points(i,:) - centroids(j,:));
    endfor
    cost += min(v);
    % calculez costul pentru fiecare centroid, si adun la suma
  endfor
endfunction

