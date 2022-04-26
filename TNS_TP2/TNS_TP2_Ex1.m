clear variable;
close all;

%% Question 1

%Séquence s[k] (On reste dans k positif donc U[k] = 1)
k_d = 0;
M=12;
[k,s] = Seq(k_d,M-1);

figure(1);

stem(k,s,'.')
title('Representation de s')
xlabel('indice k')
%S[n] TFD 2048 points de s[k]

N = 2048; %Nombre de points de la TFD

S = fft(s,N);

%% Question 2

%Génération du vecteur X(f) correspondant a la TFTD de x[k]
%Pour f compris entre -1.5 et 1.5-(1/N)
delta_f = 1/N ;

f = -1.5:delta_f:1.5-delta_f;
X = 1./(1-0.91*exp(-2*1i*pi*f));

%% Question 3

%Vecteur de S

f_S = 0:delta_f:1-delta_f;
%Superposition des fonctions X et S 
figure(2);

subplot(2,2,1); hold on;
title('Parties réelles de la TFD 2048-points de S[n] (avec M =12) et de la TFTD X(f)') 
plot(f_S,real(S),f,real(X))
xlabel('f,fréquence réduite');
legend('Partie réelle de S','Partie réelle de X');


subplot(2,2,2);hold on
title('Parties imaginaires de la TFD 2048-points de S[n] (avec M =12) et de la TFTD X(f)') 
plot(f_S,imag(S),f,imag(X))
xlabel('f,fréquence réduite');
legend('Partie imaginaire de S','Partie imaginaire de X');

subplot(2,2,3);hold on
title('Modules de la TFD 2048-points de S[n] (avec M =12) et de la TFTD X(f)') 
plot(f_S,abs(S),f,abs(X))
xlabel('f,fréquence réduite');
legend('Module de S','Module de X');

subplot(2,2,4);hold on
title('Phases de la TFD 2048-points de S[n] (avec M =12) et de la TFTD X(f)') 
plot(f_S,angle(S),f,angle(X))
xlabel('f,fréquence réduite');
legend('Phase de S','Phase de X');

%% Question 4

%Modification de q3 avec fftshift

S_shift = fftshift(S);
X_shift = fftshift(X);

figure(3);

subplot(2,2,1); hold on;
title('Parties réelles de la TFD 2048-points de S[n] (avec M =12) et de la TFTD X(f)') 
plot(f_S,real(S_shift),f,real(X_shift))
xlabel('f,fréquence réduite');
legend('Partie réelle de S','Partie réelle de X');


subplot(2,2,2);hold on
title('Parties imaginaires de la TFD 2048-points de S[n] (avec M =12) et de la TFTD X(f)') 
plot(f_S,imag(S_shift),f,imag(X_shift))
xlabel('f,fréquence réduite');
legend('Partie imaginaire de S','Partie imaginaire de X');

subplot(2,2,3);hold on
title('Modules de la TFD 2048-points de S[n] (avec M =12) et de la TFTD X(f)') 
plot(f_S,abs(S_shift),f,abs(X_shift))
xlabel('f,fréquence réduite');
legend('Module de S','Module de X');

subplot(2,2,4);hold on
title('Phases de la TFD 2048-points de S[n] (avec M =12) et de la TFTD X(f)') 
plot(f_S,angle(S_shift),f,angle(X_shift))
xlabel('f,fréquence réduite');
legend('Phase de S','Phase de X');

%% Question 5 

%On fait à nouveau l'analyse précédente mais avec M = 5;

M=5;
[k,s] = Seq(k_d,M-1);

%S[n] TFD 2048 points de s[k]

N = 2048; %Nombre de points de la TFD

S = fft(s,N);
%Génération du vecteur X(f) correspondant a la TFTD de x[k]
%Pour f compris entre -1.5 et 1.5-(1/N)
delta_f = 1/N ;

f = -1.5:delta_f:1.5-delta_f;
X = 1./(1-0.91*exp(-2*1i*pi*f));

S_shift = fftshift(S);
X_shift = fftshift(X);

figure(4);

subplot(2,2,1); hold on;
title('Parties réelles de la TFD 2048-points de S[n] (avec M =5) et de la TFTD X(f)') 
plot(f_S,real(S_shift),f,real(X_shift))
xlabel('f,fréquence réduite');
legend('Partie réelle de S','Partie réelle de X');


subplot(2,2,2);hold on
title('Parties imaginaires de la TFD 2048-points de S[n] (avec M =5) et de la TFTD X(f)') 
plot(f_S,imag(S_shift),f,imag(X_shift))
xlabel('f,fréquence réduite');
legend('Partie imaginaire de S','Partie imaginaire de X');

subplot(2,2,3);hold on
title('Modules de la TFD 2048-points de S[n] (avec M =5) et de la TFTD X(f)') 
plot(f_S,abs(S_shift),f,abs(X_shift))
xlabel('f,fréquence réduite');
legend('Module de S','Module de X');

subplot(2,2,4);hold on
title('Phases de la TFD 2048-points de S[n] (avec M =5) et de la TFTD X(f)') 
plot(f_S,angle(S_shift),f,angle(X_shift))
xlabel('f,fréquence réduite');
legend('Phase de S','Phase de X');

%On fait à nouveau l'analyse précédente mais avec M = 40;
M=40;
[k,s] = Seq(k_d,M-1);

%S[n] TFD 2048 points de s[k]

N = 2048; %Nombre de points de la TFD

S = fft(s,N);

%Génération du vecteur X(f) correspondant a la TFTD de x[k]
%Pour f compris entre -1.5 et 1.5-(1/N)
delta_f = 1/N ;

f = -1.5:delta_f:1.5-delta_f;
X = 1./(1-0.91*exp(-2*1i*pi*f));
S_shift = fftshift(S);
X_shift = fftshift(X);

figure(5);

subplot(2,2,1); hold on;
title('Parties réelles de la TFD 2048-points de S[n] (avec M =40) et de la TFTD X(f)') 
plot(f_S,real(S_shift),f,real(X_shift))
xlabel('f,fréquence réduite');
legend('Partie réelle de S','Partie réelle de X');


subplot(2,2,2);hold on
title('Parties imaginaires de la TFD 2048-points de S[n] (avec M =40) et de la TFTD X(f)') 
plot(f_S,imag(S_shift),f,imag(X_shift))
xlabel('f,fréquence réduite');
legend('Partie imaginaire de S','Partie imaginaire de X');

subplot(2,2,3);hold on
title('Modules de la TFD 2048-points de S[n] (avec M =40) et de la TFTD X(f)') 
plot(f_S,abs(S_shift),f,abs(X_shift))
xlabel('f,fréquence réduite');
legend('Module de S','Module de X');

subplot(2,2,4);hold on
title('Phases de la TFD 2048-points de S[n] (avec M =40) et de la TFTD X(f)') 
plot(f_S,angle(S_shift),f,angle(X_shift))
xlabel('f,fréquence réduite');
legend('Phase de S','Phase de X');




