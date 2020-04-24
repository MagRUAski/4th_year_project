%Function nearest()
function NNPath = Nearest(RPNUM,adjacency)
    k = 1;
    Next = randi(RPNUM);            %Start from random node

while(k<=RPNUM)
    
    Neighbors = adjacency(Next,:);  %Get distances of all Neighbors
    Previous(k) = Next;             %Record nodes that have been visited
    Neighbors(Previous) = inf;      %Exclude distances of visited nodes
    Dissorted=sort(Neighbors,'ascend');  %sort distance

    i=1;
    Nexts=(find(Neighbors==Dissorted(i)));%Find the ID of the node to visit, there could be multiple nearest neighbors
    Next = Nexts(1);
    k=k+1;
    
end

NNPath = Previous;