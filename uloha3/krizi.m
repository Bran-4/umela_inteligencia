
function[pop]=krizi(pop)
    pocet=size(pop,1);
    nahodne_poradie=randperm(pocet);
    x=1;
    while true
        x=x+2;
        if x+1>pocet
            break;
        end
        cislo=randi([2,17]);
        parent1=pop(nahodne_poradie(x),:);
        parent2=pop(nahodne_poradie(x+1),:);
        child1=parent2(1:cislo);
        child2=[1,parent1((cislo+1):(end-1))];
        a=1;
        while true
            if ismember(parent1(a),child1)
                %
            else
                child1=[child1,parent1(a)];
            end
            if length(child1)==20
                break;
            end
            a=a+1;
        end
        a=1;
        while true
            if ismember(parent2(a),child2)
                %
            else
                child2=[child2,parent2(a)];
            end
            if length(child2)==20
                break;
            end
            a=a+1;
        end    
        pop(nahodne_poradie(x),:)=child1;
        pop(nahodne_poradie(x+1),:)=child2;
    end
end