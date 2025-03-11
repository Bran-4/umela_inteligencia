function[minimum]=horolezec3d();

values = -800:5:800; % Vytvorenie možných hodnôt
nahodna_x= values(randi(length(values))); % Náhodný výber jednej hodnoty
nahodna_y= values(randi(length(values))); % Náhodný výber jednej hodnoty

while true
    nahodna=[nahodna_x,nahodna_y];
    lava=[nahodna_x-5,nahodna_y];
    prava=[nahodna_x+5,nahodna_y];
    dole=[nahodna_x,nahodna_y+5];
    hore=[nahodna_x,nahodna_y-5];

    nahodna_hodn=testfn3b(nahodna);
    prava_hodn=testfn3b(prava);
    lava_hodn=testfn3b(lava);
    hore_hodn=testfn3b(hore);
    dole_hodn=testfn3b(dole);

    zoznam=[prava_hodn,lava_hodn,hore_hodn,dole_hodn];
    zoznam2=[prava,lava,hore,dole];

    [~, index_min] = min(zoznam); 
    if zoznam(index_min)>nahodna_hodn
        plot3(nahodna_x,nahodna_y,nahodna_hodn,'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); 
        break;
    else
        plot3(nahodna_x,nahodna_y,nahodna_hodn, 'go', 'MarkerSize', 2, 'MarkerFaceColor', 'b'); 
        nahodna_x = zoznam2(index_min*2-1);  % Aktualizujeme x
        nahodna_y = zoznam2(index_min*2);  
        if nahodna_x>800 || nahodna_x<-800 || nahodna_y>800 ||nahodna_y<-800
            break;
        end
    end 
end 
minimum=nahodna;
end