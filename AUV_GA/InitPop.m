%Generate 1st population
function popparent = InitPop(Popsize,RPNUM,adjacency,Mixrate)
popparent = zeros(Popsize,RPNUM);
for i = 1:Popsize
    %if(i<=(Mixrate*Popsize))
    %Normal 1st gen
    %popparent(i,:)=randperm(RPNUM); %1:RPNUM integers without repetition 
    %else
    %Elite 1st gen
    popparent(i,:) = Nearest(RPNUM,adjacency); %Use Nearest Neighbor to get Elite 1st gen
    %end
end

