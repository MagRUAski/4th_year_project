% Function for crossover and avoiding conflicts
function crossover = Crossover(pop,Pcross)
crossover=pop;
k=1;
while (k<=(size(crossover,1)-1))
    %Russian roulette to decide whether crossover occurs
    Pc = unifrnd(0,1);      
    if(Pc<Pcross)
        SS = unidrnd(size(crossover,2)); %Start point of crossover section
        SE = unidrnd(size(crossover,2));   %End point of crossover section
        while(SS == SE) 
            SE = unidrnd(size(crossover,2));
        end
        if(SE<SS) %Order
            temp = SE;
            SE = SS;
            SS=temp;
        end
        Chrom1=crossover(k,:);          %First chromosome for crossover
        Chrom2=crossover(k+1,:);        %Second chromosome for crossover
        CS2=Chrom1(SS:SE);        %crossover section 1
        CS1=Chrom2(SS:SE);        %crossover section 2
        Chrom1(SS:SE)=CS1;        %crossover finished
        Chrom2(SS:SE)=CS2;        %crossover finished
        
        %Avoid conflict
        LIST=unique(Chrom1); %list all unique numbers
        COUNTA=hist(Chrom1,unique(Chrom1)); %Distribute elements on chromosomes to corresponding unique numbers
        ISDUP = COUNTA - ones(1,size(COUNTA,2)); %If there is a duplicate number, the result will be non-zero array
        DUPElem=LIST(find(ISDUP));          %Find the duplicate elements
        ElemPosition=ismember(CS1,DUPElem); %Find the duplicate elements' position
        RELATION=zeros(1,size(Chrom1,2));
        
        %Set up relacement relation table
        i=1;
        while i<=size(CS1,2)
            if((ElemPosition(i)==0))
                i=i+1;
            else
                a=CS1(i);
                b=CS2(i);
                if (~ismember(b,CS1))
                    RELATION(a)=b;
                    RELATION(b)=a;
                else
                    while(ismember(b,CS1))
                        temp=b;
                        position=find(CS1==temp);
                        b=CS2(position); %#ok<FNDSB>
                    end
                    RELATION(a)=b;
                    RELATION(b)=a;
                end
                i=i+1;
            end
        end
        j=1;
        %Replacement
        while(j<=size(Chrom1,2))
            while(j>=SS&&j<=SE)
                j=j+1;
            end
            if(j>size(Chrom1,2))
                break
            end
            if(RELATION(Chrom1(j))==0)
                j=j+1;
            else
                Chrom1(j)=RELATION(Chrom1(j));
                j=j+1;
            end
        end
        j=j-1;
        while(j~=0)
            while(j>=SS&&j<=SE)
                j=j-1;
            end
            if(j==0)
                break;
            end
            if(RELATION(Chrom2(j))==0)
                j=j-1;
            else
                Chrom2(j)=RELATION(Chrom2(j));
                j=j-1;
            end
        end
        
        crossover(k,:)=Chrom1;
        crossover(k+1,:)=Chrom2;
        
    end
    k=k+2;
end


    
        
    