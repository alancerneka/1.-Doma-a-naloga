% Definicija funkcije mcc_pi
function [koordinate_krog, koordinate_kvadrat] = mcc_pi(tocke)
    % Inicializacija spremenljivk
    tocke_krog = zeros(tocke, 2);
    tocke_kvadrat = zeros(tocke, 2);
    stevilo_krog = 0;
    stevilo_kvadrat = 0;

    % For zanka za generacijo naključnih točk 
    % na območju -1 < x < 1 in -1 < y < 1 
    for i = 1:tocke
        x = rand() * 2 - 1; 
        y = rand() * 2 - 1; 
        if x^2 + y^2 <= 1
            stevilo_krog = stevilo_krog + 1;
            tocke_krog(stevilo_krog, :) = [x, y];
        else
            stevilo_kvadrat = stevilo_kvadrat + 1;
            tocke_kvadrat(stevilo_kvadrat, :) = [x, y];
        end
    end

    tocke_krog = tocke_krog(1:stevilo_krog, :);
    tocke_kvadrat = tocke_kvadrat(1:stevilo_kvadrat, :);

    % Vrne koordinate točk znotraj kroga in znotraj kvadrata, a ne kroga
    
    koordinate_krog = tocke_krog;
    
    koordinate_kvadrat = tocke_kvadrat;
    
    % Izpis točk znotraj kroga
    disp('Te točke so v krogu:');
    disp(koordinate_krog);


    % Izpis točk znotraj kvadrata
    disp('Te točke so v kvadratu:');
    disp(koordinate_kvadrat);
end
