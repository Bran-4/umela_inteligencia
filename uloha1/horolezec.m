function[minimum]=horolezec();

%nahodna=randi([-800,800]);

values = -800:5:800; % Vytvorenie možných hodnôt
nahodna= values(randi(length(values)));
while true
    lava=nahodna-5;
    prava=nahodna+5;
    prava_hodn=testfn3b(prava);
    lava_hodn=testfn3b(lava);
    nahodn_hodn=testfn3b(nahodna);
    if nahodn_hodn<prava_hodn && nahodn_hodn<lava_hodn
        plot(nahodna, nahodn_hodn, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); 
        break;
    elseif prava_hodn>lava_hodn
        plot(nahodna, nahodn_hodn, 'bo', 'MarkerSize', 2, 'MarkerFaceColor', 'b'); 
        if lava<-800
            break;
        end
        nahodna=lava;
    else
        plot(nahodna, nahodn_hodn, 'bo', 'MarkerSize', 2, 'MarkerFaceColor', 'b'); 
        if prava>800
            break;
        end
        nahodna=prava;
    end 
end 
minimum=nahodna;
end