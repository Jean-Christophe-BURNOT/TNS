clear variable;
close all;

%% Question 1 :

[s,nu_e]=audioread('signal15.wav');

f_c = 2500; % Fréquence de coupure précédente 2900

%nu_e = 16000; %fréquence d'échantillonnage

Rp = 1; %Atténuation à la fréquence de coupure en dB

Rs = 100; %Pour avoir un gain de -100db dans la bande coupante qui semblait être une atténuation satisfaisante précédemment
Wp = f_c*2*pi; %Pulsation de coupure

n= 7; %Ordre du filtre imposé dans le sujet

[b,a] = ellip(n,Rp,Rs,Wp,'s');


%Le diagramme pôle zéro et la gain complexe et la phase


[G,wout] = freqs(b,a);

figure(1);

subplot (2,1,1);hold on;
title('Module du gain complexe en dB du filtre analogique')
f = wout/(2*pi); % Fréquence réelle w sur  2*pi
plot(f,20*log10(abs(G)))
xlabel('fréquence réelle f')
ylabel('Gain en dB')
xlim([0 8000])

subplot (2,1,2); hold on;
title('Phase du gain complexe du filtre analogique')

plot(f,unwrap(angle(G))) % unwrap corrige les discontinuité supérieur a pi or on n'en a pas.
xlabel('fréquence réelle f')
ylabel('Phase en radian')
xlim([0 8000])

[b_num,a_num] = bilinear(b,a,nu_e); % On fait la transformée bilineaire

%% Filtre num :

[h,t] = impz(b_num,a_num);

[H,F] = freqz(b_num,a_num,4096,nu_e);

figure(2);
subplot(2,2,1);hold on;
title('Diagramme pôles-zéros du filtre RII numérique')

zplane(roots(b_num),roots(a_num))

subplot(2,2,2);hold on;
title('Réponse impulsionnelle du filtre RII numérique')
stem(0:1:7,b_num)
xlabel('indices k')


subplot (2,2,3);hold on;
title('Module du gain complexe en dB du filtre RII numérique')

plot(F,abs(H))
xlabel('fréquence réelle f')
ylabel('Gain linéaire')

subplot (2,2,4); hold on;
title('Phase du gain complexe du filtre RII numérique')

plot(F,unwrap(angle(H))) % unwrap corrige les discontinuité supérieur a pi or on n'en a pas.
xlabel('fréquence réelle f')
ylabel('Phase en radian')

%% Filtrage

sig_filt = filter(b_num,a_num,s);


soundsc(sig_filt,nu_e)

sgram(sig_filt,nu_e,60,3)

