function view_cost_vs_nc(file_points)
  figure(2)
  format long
  output_precision(16);
  fisier1 = fopen(file_points,'r');
  points = dlmread(file_points,' ',5,0);
  fclose(fisier1);
  cost_v = zeros(1,10);
  for nc = [1 : 10]
    centroids = clustering_pc(points,nc);
    cost_v(nc) = compute_cost_pc(points,centroids);
    % calculez costul pentru fiecare nc de la {1,2...,10}
  endfor
   x =[1:10];
   plot(x,cost_v); % trasez graficul;
endfunction

