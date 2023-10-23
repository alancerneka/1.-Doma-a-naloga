% Definiramo število naključnih točk
tocke = 10000;

% Klic funkcije mcc_pi
[koordinaate_krog, koordinate_kvadrat] = mcc_pi(tocke);

% Klic lokalne funkcije area_pi
[priblizek_pi, napaka] = area_pi(koordinaate_krog, tocke);

% Izpis rezultatov
fprintf('Ocena pi: %f\n', priblizek_pi);
fprintf('Napaka: %f\n', napaka);

% Anonimna funkcija za izračun točk na loku krožnice
krozni_lok = @(theta) [cos(theta); sin(theta)];


theta = (0: 0.01 : 2*pi); 
krog = krozni_lok(theta); 

figure;
hold on;
% Točke v krogu
plot(koordinaate_krog(:, 1), koordinaate_krog(:, 2), 'b.', "DisplayName","točke znotraj krožnice"); 

% Točke znotraj kvadrata in ne kroga
plot(koordinate_kvadrat(:, 1), koordinate_kvadrat(:, 2), 'g.', "DisplayName","točke znotraj kvadrata in zunaj krožnice"); 

% Kroznica
plot(krog(1,:), krog(2,:), 'r-', 'LineWidth', 1, "DisplayName","krožnica"); 
axis equal;
legend
title("Aproksimacija π po metodi Monte Carlo")
xlabel("x")
ylabel("y")
hold off;

% Definicija lokalne funkcije area_pi
function [priblizek_pi, napaka] = area_pi(koordinaate_krog, tocke)
    % Izračunamo oceno pi
    priblizek_pi = 4 * size(koordinaate_krog, 1) / tocke;

    % Izračunamo napako, ki jo naredimo od prave vrednosti
    napaka = abs(priblizek_pi - pi);
end
