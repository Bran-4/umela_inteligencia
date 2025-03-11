function[]=uloha2();
pop=genrpop(10,[-800 * ones(1, 100);800 * ones(1, 100)]);
pop=pop';
x=0;
bestfitnesshist=zeros(1,500);
while true
    x=x+1;
    oldfit=testfn3b(pop);
    [Newpop,Newfit]=selbest(pop,oldfit,[1,1,1,1,1,1,1,1,1,1]);
    if x>500
        break;
    end
    bestfitnesshist(x)=Newfit(1);
    %plot(x, Newfit(1),'g.');
    newpop_pracovna_nedokonc=[selbest(pop,oldfit,[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);selrand(pop,oldfit,75)];

    %idx = randperm(size(newpop_pracovna_nedokonc, 1)); % Náhodné indexy riadkov
    %newpop_pracovna = newpop_pracovna_nedokonc(idx, :); % Premiešanie podľa indexov
    skrizene=crossov(newpop_pracovna_nedokonc,2,0);
    
    zmutovane=mutx(skrizene,0.1,[-800,-800,-800,-800,-800,-800,-800,-800,-800,-800;800,800,800,800,800,800,800,800,800,800,]);

    pop=[Newpop;zmutovane];
end

plot(1:500, bestfitnesshist);
disp(bestfitnesshist(500));