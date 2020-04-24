%Select the first half best fitnesses 
function nextpop = Select(combopop,fitness)

m=size(combopop,1);
nextpopTEMP=combopop;
fitsorted=sort(fitness,'ascend');  %sort fitness
i=1;
BestPlans=(find(fitness==fitsorted(i)));%Find positions of best fitness, there could be multiple best fitness
BestPlan=BestPlans(1);
while(i<=(m/2))
    numelement=find(fitness==fitsorted(i));
    n = size(numelement,2);
    for j = 1:n
        ROW=numelement(j);
        nextpopTEMP(i+j-1,:)=combopop(ROW,:);%Select the first half of best according to best fitness position
    end
    i = i+j;
end
nextpop.pop=nextpopTEMP(1:(m/2),:);
nextpop.bestplan=BestPlan;
    



        
        
    

