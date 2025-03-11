d=8;
pop=genrpop(100,[-800 * ones(1, 1000);800 * ones(1, 1000)]);
pop=pop';
figure;
hold on;
x=0;
while true
    x=x+1;
    oldfit=testfn3b(pop);
    [Newpop,Newfit]=selbest(pop,oldfit,ones(1, 100));
    if x>600
        break;
    end
    plot(x, Newfit(1),'g.');
    newpop_pracovna_nedokonc=[selbest(pop,oldfit,ones(1,300));selrand(pop,oldfit,600)];

    %idx = randperm(size(newpop_pracovna_nedokonc, 1)); % Náhodné indexy riadkov
    %newpop_pracovna = newpop_pracovna_nedokonc(idx, :); % Premiešanie podľa indexov
    skrizene=crossov(newpop_pracovna_nedokonc,5,0);
    
    zmutovane=mutx(skrizene,0.01,[-800 * ones(1, 100);800 * ones(1, 100)]);

    pop=[Newpop;zmutovane];
end