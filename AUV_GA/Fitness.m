% Function of calculating fitness for population
function fitness = Fitness(pop,adjacency)
for i = 1:size(pop,1)
   
    dist=0;
    for k = 2:size(pop,2)
        dist = dist + adjacency(pop(i,k-1),pop(i,k)); %Add the distance between points
    end
    dist = dist + adjacency(pop(i,1),pop(i,size(pop,2)));%Add the distance from end point to start point
    fit(i).fitness=dist;
  
end
fitness = [fit.fitness];