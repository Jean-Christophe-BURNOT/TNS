clear variable;
close all;

i = complex(0,1);
%% Question 1 
% On souhaite calculer a partir des fréquences à eliminer les zéros du
% filtre
%Voir préparation 
nu_e = 20000;
%Fréquences à eliminer :

nu_1 = 2625;
nu_2 = 7280;
nu_3 = 10000;

%Leur fréquence réduite :
f_1 = nu_1/nu_e;
f_2 = nu_2/nu_e;
f_3 = nu_3/nu_e;

% On sait que z_i = exp(2*li*pi*f_i)

z_1 = exp(2*i*pi*f_1);
z_2 = exp(2*i*pi*f_2);
z_3 = exp(2*i*pi*f_3);
z_1_conj = conj(z_1);
z_2_conj = conj(z_2);
z_3_conj = conj(z_3);

%% Question 2

b_l = poly([z_1 z_2 z_3 z_1_conj z_2_conj]); %On retire les coeffs du polynome en donnant les racines

%% Queston 3

% On calcul le gain complexe G du filtre.
% On évalue la fonction en z = 1:
b_l = b_l/sum(b_l); % On somme les elements de la matrice , voir préparation et cours pour la formule de H en fonction de b_l pour les RIF
%Voir rapport
% On a également la somme des a_l qui vaut 1  car nous somme sur un RIF.

a_k = [1 0 0 0 0 0 0];
[G,w] = freqz(b_l,a_k,512);

%% Question 4

% On construit notre polynome pour la méthode roots on donne donc juste les
% coefficients


figure(1);
subplot(2,2,1);hold on;
title('Diagramme pôles-zéros')

zplane(roots(b_l))

subplot(2,2,2);hold on;
title('Réponse impulsionnelle')
stem(0:1:5,b_l)
xlabel('indices k')


subplot (2,2,3);hold on;
title('Module du gain complexe en dB')
f = nu_e*w/(2*pi); % Fréquence réelle
plot(f,20*log10(abs(G)))
xlabel('fréquence réelle f')
ylabel('Gain en dB')

subplot (2,2,4); hold on;
title('Phase du gain complexe')

plot(f,unwrap(angle(G))) % unwrap corrige les discontinuité supérieur a pi or on n'en a pas.
xlabel('fréquence réelle f')
ylabel('Phase en radian')



%% 2.3 Application du filtrage

load signal1.mat % rend notre signal disponible dans une variable s et t 
% ce signal est échantillionner a 20 k Hz
%% Question 1

nu_1 = 2625;
nu_2 = 7280;
sin1 = 8*sin(2*pi*nu_1*t);
sin2 = 8*sin(2*pi*nu_2*t);
signal_brouille = s + sin1 + sin2;

%filtrage du signal

signal_filtre = filter(b_l,a_k,signal_brouille);




%Trace des courbes

figure(2);
subplot(311); hold on;
title('Signal 1 naturel s')
plot(t,s);
xlabel('Temps (s)')

subplot(312); hold on;
plot(t,signal_brouille)
title('Signal 1 perturbé a nu_1 = 2625 et nu_2=7280')
xlabel('Temps (s)')

subplot(313); hold on;
title('Signal 1 filtré sans les perturbations a nu_1 = 2625 et nu_2=7280')
plot(t,signal_filtre)
xlabel('Temps (s)')

d_s = abs(fft(s)).^2;
d_signal_brouille = abs(fft(signal_brouille)).^2;
d_Signal_filtre = abs(fft(signal_filtre)).^2;

figure(3);
subplot(311); hold on
plot(0:nu_e/2048:nu_e-nu_e/2048,d_s);
xlim([0 10000])
xlabel('fréquence réelle f')

subplot(312); hold on
plot(0:nu_e/2048:nu_e-nu_e/2048,d_signal_brouille)
xlim([0 10000])
xlabel('fréquence réelle f')

subplot(313); hold on
plot(0:nu_e/2048:nu_e-nu_e/2048,d_Signal_filtre)
xlim([0 10000])
xlabel('fréquence réelle f')













