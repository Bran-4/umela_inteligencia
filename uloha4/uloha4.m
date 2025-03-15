function[]=uloha4();
pop=genrpop(5,[0* ones(1, 200);10000000* ones(1, 200)]);
pop=pop';
x=0;
bestfitnesshist=zeros(1,1000);
while true
    x=x+1;
    %oldfit=hodnota_deathPenalty(pop);
    %oldfit=hodnota_schodovapenalta(pop);
    oldfit=postupna_penalta(pop);
    [Newpop,Newfit]=selbest(pop,oldfit,[1,1,1,1,1]);%10
    if x>1000
        break;
    end
    bestfitnesshist(x)=Newfit(1);
    %plot(x, Newfit(1),'g.');
    newpop_pracovna_nedokonc=[selbest(pop,oldfit,[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);selrand(pop,oldfit,175)];%20

    %idx = randperm(size(newpop_pracovna_nedokonc, 1)); % Náhodné indexy riadkov
    %newpop_pracovna = newpop_pracovna_nedokonc(idx, :); % Premiešanie podľa indexov
    skrizene=crossov(newpop_pracovna_nedokonc,1,0);
    %zmutovane1=muta(skrizene,0.1,[1000,1000,1000,1000,1000],[0,0,0,0,0;10000000* ones(1, 5)]);
    zmutovane=mutx(skrizene,0.2,[0,0,0,0,0;10000000* ones(1, 5)]);
    
    pop=[Newpop;zmutovane];
end
disp(Newpop(1,:));
bestfitnesshist=-1*bestfitnesshist;
plot(1:1000, bestfitnesshist);
grid on;
%figure;
%neg_indices = find(bestfitnesshist < 0);
%plot(neg_indices, bestfitnesshist(neg_indices), 'r.-'); 
disp(bestfitnesshist(1000));