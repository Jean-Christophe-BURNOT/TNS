function [k,s] = Seq(A,f0,phi,kd,kf)
    k = kd:kf;
    s = A*(sin(2*pi*k*f0+phi));
end
% Fonction qui permet de g�n�rer des s�quences s(k] du type 
% s[k] = A*sin(2pi*k*f0+phi)
% en lui donnant A, f0,phi, l'indice de d�part et de fin
% et qui renvoie cette s�quence et un vecteur avec les indices aussi
% A sans unit� connue, f0 sans unit� car c'est une fr�quence r�duite, kd et kf des
% entier, phi un angle en radiant