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

% Vizualizacija
theta = (0: 0.01 : 2*pi); % Koti za izris krožnice
krog = krozni_lok(theta); % Točke na loku krožnice

figure;
hold on;
% Točke v krogu
plot(koordinaate_krog(:,1), koordinaate_krog(:,2), 'b.'); 

% Točke znotraj kvadrata in ne kroga
plot(koordinate_kvadrat(:,1), koordinate_kvadrat(:,2), 'g.'); 

% Kroznica
plot(krog(1,:), krog(2,:), 'r-', 'LineWidth', 1); 
axis equal;
hold off;

% Definicija lokalne funkcije area_pi
function [priblizek_pi, napaka] = area_pi(koordinaate_krog, tocke)
    % Izračunamo oceno pi
    priblizek_pi = 4 * size(koordinaate_krog, 1) / tocke;

    % Izračunamo napako, ki jo naredimo od prave vrednosti
    napaka = abs(priblizek_pi - pi);
end
