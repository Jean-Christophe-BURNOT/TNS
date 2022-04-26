function [k,s] = Seq(A,f0,phi,kd,kf)
    k = kd:kf;
    s = A*(sin(2*pi*k*f0+phi));
end
% Fonction qui permet de générer des séquences s(k] du type 
% s[k] = A*sin(2pi*k*f0+phi)
% en lui donnant A, f0,phi, l'indice de départ et de fin
% et qui renvoie cette séquence et un vecteur avec les indices aussi
% A sans unité connue, f0 sans unité car c'est une fréquence réduite, kd et kf des
% entier, phi un angle en radiant