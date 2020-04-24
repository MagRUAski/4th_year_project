%Mutation by swaping genes and get Chindren population
function Childpop = Mutation(crossover,Pmutation)
Childpop = crossover;
k=1;
while(k<=size(Childpop,1))
    %Russian roulette
    Pm = unifrnd(0,1);
    if(Pm<Pmutation)
        
        Gene=Childpop(k,:);
        a = unidrnd(size(Childpop,2));
        b = unidrnd(size(Childpop,2));
        while(a==b)
            b = unidrnd(size(Childpop,2));
        end
        %Mutation by swapping genes
        Temp=Gene(a);
        Gene(a)=Gene(b);
        Gene(b)=Temp;
        Childpop(k,:)=Gene;
    end
    k=k+1;
end


