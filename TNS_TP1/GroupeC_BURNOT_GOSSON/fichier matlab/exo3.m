clear variables;
close all;

%Mise en place de nos variables
A1 = 8;
nu1 = 271;
phi1 = 25;
A2 = 5;
nu2 = 1147;
phi2 = 38;
td = 0;
tf = 18.41;
nuE = 5000;

[t,x,K] = Seq2(A1,nu1,phi1,A2,nu2,phi2,td*0.001,tf*0.001,nuE); % Création de notre séquence

figure(1)

stem(t*1000,x) % Affichage de la séquence
xlabel("t en ms")
ylabel("signal x")
legend("x")
title("Tracé du signal x(t) = A1sin(2pi*nu_1*t+phi_1) +A2sin(2pi*nu_2*t+phi_2)")

% TFD K-points
N = K; %Nombre de point de la TFD
X1 = fft(x,N); %Création de la TFD K-points de notre séquence

figure(2); % Affichage de la partie réelle de la TFD K-points avec trois modes de graduations

subplot(1,3,1)  
stem(0:N-1,real(X1))
xlabel("n (indice)")
ylabel("real(X1)")
title("partie réelle de X1 graduée en indice")

subplot(1,3,2)
stem(0:1/N:1-1/N,real(X1))
xlabel("fréquence réduite")
ylabel("real(X1)")
title("partie réelle de X1 graduée en fréquence réduite")

subplot(1,3,3)
stem(0:nuE/(N*1000):(nuE/1000)-nuE/(N*1000),real(X1))
xlabel("nu (en kHz)")
ylabel("real(X1)")
title("partie réelle de X1 graduée en fréquence réelle en kHz")

figure(3) % Affichage de la partie imagine de la TFD K-points avec trois modes de graduations

subplot(1,3,1)
stem(0:N-1,imag(X1))
xlabel("n (indice)")
ylabel("imag(X1)")
title("partie imaginaire de X1 graduée en indice")

subplot(1,3,2)
stem(0:1/N:1-1/N,imag(X1))
xlabel("fréquence réduite")
ylabel("imag(X1)")
title("partie imaginaire de X1 graduée en fréquence réduite")

subplot(1,3,3)
stem(0:nuE/(N*1000):(nuE/1000)-nuE/(N*1000),imag(X1))
xlabel("nu (en kHz)")
ylabel("imag(X1)")
title("partie imaginaire de X1 graduée en fréquence réelle en kHz")

figure(4); % Affichage du module de la TFD K-points avec trois modes de graduations

subplot(1,3,1)
stem(0:N-1,abs(X1))
xlabel("n (indice)")
ylabel("abs(X1)")
title("module de X1 graduée en indice")

subplot(1,3,2)
stem(0:1/N:1-1/N,abs(X1))
xlabel("fréquence réduite")
ylabel("abs(X1)")
title("module de X1 graduée en fréquence réduite")

subplot(1,3,3)
stem(0:nuE/(N*1000):(nuE/1000)-nuE/(N*1000),abs(X1))
xlabel("nu (en kHz)")
ylabel("abs(X1)")
title("module de X1 graduée en fréquence réelle en kHz")

figure(5); % Affichage de la phase de la TFD K-points avec trois modes de graduations

subplot(1,3,1)
stem(0:N-1,angle(X1))
xlabel("n (indice)")
ylabel("angle(X1) en rad")
title("phase de X1 graduée en indice")

subplot(1,3,2)
stem(0:1/N:1-1/N,angle(X1))
xlabel("fréquence réduite")
ylabel("angle(X1) en rad")
title("phase de X1 graduée en fréquence réduite")

subplot(1,3,3)
stem(0:nuE/(N*1000):(nuE/1000)-nuE/(N*1000),angle(X1))
xlabel("nu (en kHz)")
ylabel("angle(X1) en rad")
title("phase de X1 graduée en fréquence réelle en kHz")

% TFD 512-points
N = 512; % Nombre de points de la TFD
X2 = fft(x,N);%Création de la TFD 512-points de notre séquence

figure(6); % Affichage du module de la TFD 512-points avec trois modes de graduations

subplot(1,3,1)
plot(0:N-1,abs(X2))
xlabel("n (indice)")
ylabel("abs(X2)")
title("module de X2 gradué en indice")

subplot(1,3,2)
plot(0:1/N:1-1/N,abs(X2))
xlabel("fréquence réduite")
ylabel("abs(X2)")
title("module de X2 gradué en fréquence réduite")

subplot(1,3,3)
plot(0:nuE/(N*1000):(nuE/1000)-nuE/(N*1000),abs(X2))
xlabel("nu (en kHz)")
ylabel("abs(X2)")
title("module de X2 gradué en fréquence réelle en kHz")