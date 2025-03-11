
B=[0,0; 25,68; 12,75; 32,17; 51,64; 20,19; 52,87;
80,37; 35,82; 2,15; 50,90; 13,50; 85,52; 97,27; 37,67;
20,82; 49,0; 62,14; 7,60; 100,100];


%dlzka=hladajvzdialenost([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],B);
%generovat pop
najlepsi=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
for i=1:5

pop = zeros(300, 20); % Inicializácia matice

for i = 1:300
    pop(i, :) = [1, randperm(18) + 1, 20]; % Permutuje čísla 2 až 19
end
x=0;
bestfitnesshist=zeros(1,450);
while true
    x=x+1;
    oldfit=hladajvzdialenost(pop,B);
    [Newpop,Newfit]=selbest(pop,oldfit,[3,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);%50
    if x>450
       break;
    end
    bestfitnesshist(x)=Newfit(1);
    newpop_pracovna_nedokonc=[selbest(pop,oldfit,[3,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);selrand(pop,oldfit,205)];%45
    skrizena=krizi(newpop_pracovna_nedokonc);
    %skrizena=crosord(newpop_pracovna_nedokonc(:,2:end-1),0);
    zmutovane=[ones(250, 1),swapgen(skrizena(:, 2:end-1),0.04),20*ones(250, 1)];
    %zmutovane=[ones(350, 1),swapgen(skrizena,0.1),20*ones(350, 1)];

    pop=[Newpop;zmutovane];
end


plot(1:450, bestfitnesshist);
hold on;
disp(bestfitnesshist(450));
if bestfitnesshist(450)<hladajvzdialenost(najlepsi,B)
    najlepsi=Newpop(1,:);
end

end
hold off;
for i=1:20
    C(i,:)=B(najlepsi(i),:);
end
figure;
plot(C(:,1),C(:,2),'r-','LineWidth',2);