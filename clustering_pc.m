% computes the NC centroids corresponding to the given points using K-Means
function centroids = clustering_pc(points, NC);
  output_precision(15);
  n = length(points);
  points = reorder_by_x(points); % reordonez punctele crescator dupa x
  rand_centroids = randperm(n,NC); % permut {1,2...,n} si iau primele NC valori ale permutarii
  new_centroids = zeros(NC,3); % initializez noul vector de centroizi cu 0
  centroids(1:NC,:) = points(rand_centroids(1:NC),:); % aleg NC centroizi distincti baza permutarii generate
  Data = zeros(n,1); % initializez un vector in care stochez index-ul centroidului de care apartine fiecare punct
  sum = zeros(NC,4); % initializez o matrice in care voi calcula noii centroizi, iar o coloana corespunde 
                     % numarului de puncte asociate unui anumit centroids
  sum(:,1) = 0;
  tolerance =1e-5;
  diference = new_centroids - centroids;
 while max(norm(diference, 2, "rows")) > tolerance 
   new_centroids = centroids;
  for i = [1:n]
    v = zeros(1,NC);
    for j = [1:NC]
      v(j) = norm(points(i,:)-centroids(j,:));
      % pt fiecare punct calculez de ce centroid apartine;
  endfor
  [~,index] = min (v);
  Data(i,1) = index;
  sum(Data(i,1),1) += 1;
  sum(Data(i,1),2:4) += points(i,:); 
  % calculez suma punctelor ce apartin de un centroid
endfor
    for i = [1:NC]
      sum(i,:) /= sum(i,1);
      centroids(i,:) = sum(i,2:4);
      % determin noua matrice de centroizi
    endfor
  diference = centroids - new_centroids;  
	% TODO K-Means code 
end
  centroids = reorder_by_x(centroids);
  new_centroids = reorder_by_x(new_centroids);
endfunction
