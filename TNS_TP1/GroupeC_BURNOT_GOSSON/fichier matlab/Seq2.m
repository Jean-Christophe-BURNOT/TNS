function [t,x,K] = Seq2(A1,nu1,phi1,A2,nu2,phi2,td,tf,nuE)
    f0_1 = nu1/nuE;
    f0_2 = nu2/nuE;
    phi_1 = phi1*pi/180;
    phi_2 = phi2*pi/180;
    kd = ceil(td*nuE);
    kf = floor(tf*nuE);
    [k,s1] = Seq(A1,f0_1,phi_1,kd,kf);
    [k,s2] = Seq(A2,f0_2,phi_2,kd,kf);
    x = s1+s2;
    K = length(k);
    t = k/nuE;
end
% Fonction qui permet de générer une séquence à partir du type de signal suivant:
% s(t) =A1sin(2pi*nu1t+phi1) +A2sin(2pi*nu2t+phi2)
% en lui donnant A1 / A2, nu_1 / nu_12,phi_11 / phi_12, une date de début, une date de fin
% et la fréquence d'échantillonnage nu_e 
% et qui renvoie la séquence
% A1 / A2 sans unité donnée, nu1 / nu2 en Hz, phi1 / phi2 en °, td et tf en ms, nuE en Hz