function[minimum]=horolezec3d();

values = -800:5:800; % Vytvorenie možných hodnôt
nahodna_x= values(randi(length(values))); % Náhodný výber jednej hodnoty
nahodna_y= values(randi(length(values))); % Náhodný výber jednej hodnoty
nahodna_z= values(randi(length(values)));

while true
    nahodna=[nahodna_x,nahodna_y,nahodna_z];
    lava=[nahodna_x-5,nahodna_y,nahodna_z];
    prava=[nahodna_x+5,nahodna_y,nahodna_z];
    dole=[nahodna_x,nahodna_y+5,nahodna_z];
    hore=[nahodna_x,nahodna_y-5,nahodna_z];
    dolez=[nahodna_x,nahodna_y,nahodna_z+5];
    horez=[nahodna_x,nahodna_y,nahodna_z-5];

    nahodna_hodn=testfn3b(nahodna);
    prava_hodn=testfn3b(prava);
    lava_hodn=testfn3b(lava);
    hore_hodn=testfn3b(hore);
    dole_hodn=testfn3b(dole);
    horez_hodn=testfn3b(horez);
    dolez_hodn=testfn3b(dolez);

    zoznam=[prava_hodn,lava_hodn,hore_hodn,dole_hodn,horez_hodn,dolez_hodn];
    zoznam2=[prava,lava,hore,dole,horez,dolez];

    [~, index_min] = min(zoznam); 
    if zoznam(index_min)>nahodna_hodn
        fprintf('Hodnota premennej minimum je: %d a suradnice %d,%d,%d\n', nahodna_hodn,nahodna_x,nahodna_y,nahodna_z);
        break;
    else
        nahodna_x = zoznam2(index_min*3-2);  % Aktualizujeme x
        nahodna_y = zoznam2(index_min*3-1);  
        nahodna_z =zoznam2(index_min*3);
        if nahodna_x>800 || nahodna_x<-800 || nahodna_y>800 ||nahodna_y<-800 || nahodna_z<-800 || nahodna_z>800
            break;
        end
    end 
end 
minimum=nahodna;
end