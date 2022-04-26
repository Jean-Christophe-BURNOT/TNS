clear variable;
close all;

%% Question 1 :


analysespectrale(18,4000,6000,8192)

%On a tout d'abord commencé par prendre les valeurs maximales qui nous on
%été données 
% On se place tout d'abord a 20 kHz pour etre sur d'éviter le repliement
% spectral.
% On se rend compte que la composante maximale est environ a 6.5 kHz
%Pour respecter le critère de Shannon on se place à 14kHz (multiple de 2kHz
%et compris entre 2kHz et 20 kHz)
% Ensuite on cherche notre N, on sait que l'on veut une finesse d'analyse
% inférieur à 3 Hz et on sait que delta_nu (finesse d'analyse) = nu_e
% (échantillionnage)/ N (nombre de points de la TFD
% Donc N = nu_e/delta_nu
% Donc N = 14 000 / 3 = 4667 
% Il nous faut donc un nombre de points supérieur a 4667
% On prend donc 2^13 = 8192
% On souhaite avoir un M<N on prend la valeur maximale de M (4000) qui nous
% est proposé pour avoir le plus d'informations possible sur la fonction
% (Notre N nous le permet)
% On aura toutefois du zéro padding car N>M
