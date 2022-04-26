clear variables;
close all;
% Définition de nos variables
A1 = 8;
nu1 = 271;
phi1 = 90;
A2 = 5;
nu2 = 1147;
phi2 = 90;
td = -10.12;
tf = 10.12;
nuE = 5000;
% Création de notre signal avec la fonction Seq2
[t,x,K] = Seq2(A1,nu1,phi1,A2,nu2,phi2,td*0.001,tf*0.001,nuE);
figure(1)
stem(t*1000,x) % Affichage de notre séquence pour pouvoir l'observer
xlabel("t en ms")
ylabel("signal x")
legend("x")
title("Tracé du signal x(t) = A1sin(2pi*nu_1*t+phi_1) +A2sin(2pi*nu_2*t+phi_2)")

% TFD 512-points avec x brut
N = 512;
X = fft(x,N);
figure(2);
subplot(2,1,1);
stem(0:N-1,real(X))
xlabel("indice k)")
ylabel("real(x[k])");
title("Partie réelle de x[k]")
xlim([0 N-1])

subplot(2,1,2);
stem(0:N-1,imag(X))
xlabel("indice k")
ylabel("imag(x[k])")
title("Partie imaginaire de x[k]")
xlim([0 N-1])

% TFD 512-points avec x réorganisé en y pour avoir le bon tracé de la TFD
y = [x((K+1)/2:K) zeros(1,N-K) x(1:(K-1)/2)];

figure(3);
stem(0:1:N-1,y)
xlabel("indice k")
ylabel("y[k]")
title("Séquence y[k] qui est la réorganisation de x[k]")
xlim([0 N-1]);

N = 512;
Y = fft(y,N);

figure(4);

subplot(2,2,1)
stem(0:nuE/N:nuE-nuE/N,real(Y),'.')
xlabel("Hz")
ylabel("real(Y)")
title("Partie réelle de Y")

subplot(2,2,2)
stem(0:nuE/N:nuE-nuE/N,imag(Y),'.')
xlabel("Hz")
ylabel("imag(Y)")
title("Partie imaginaire de Y")

subplot(2,2,3)
stem(0:nuE/N:nuE-nuE/N,abs(Y),'.')
xlabel("Hz")
ylabel("abs(Y)")
title("Module de Y")

subplot(2,2,4)
stem(0:nuE/N:nuE-nuE/N,angle(Y),'.')
xlabel("Hz")
ylabel("angle(Y)")
title("Phase de Y")

