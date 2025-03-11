function[Fit]=hladajvzdialenost(Pop,B)
[lpop,lstring]=size(Pop);
Fit=zeros(1,lpop);

for i=1:lpop
    vekt=Pop(i,:);
    boda=B(vekt(1),:);
    Fit(i)=0;
    for j=2:length(vekt)
        bodb=B(vekt(j),:);
        Fit(i)=Fit(i)+sqrt((bodb(1) - boda(1))^2 + (bodb(2) - boda(2))^2);
        boda=bodb;
    end
end
end
