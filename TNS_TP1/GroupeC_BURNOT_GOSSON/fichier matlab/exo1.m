clear variables;
close all;

[k1,s1] = Seq(2,1/34,0,0,26); % Création du signal 1 avec l'aide de la fonction Seq
[k2,s2] = Seq(-4,1/26,pi/2,-13,13); % Création du signal 2 avec l'aide de la fonction Seq
[k3,s3] = Seq(1,3/32,pi/4,-10,10); % Création du signal 3 avec l'aide de la fonction Seq
[k4,s4] = Seq(1,1/(2*sqrt(23)),pi/2,0,50); % Création du signal 4 avec l'aide de la fonction Seq
figure(1);
subplot(2,2,1); % Tracé en haut à gauche dans la fenêtre du signal 1
stem(k1,s1);
title("s[k] échantillonné sur 27 points")
xlabel("k")
ylabel("s[k]")
ylabel("s[k]")

subplot(2,2,2); % Tracé en haut à droite dans la fenêtre du signal 2
stem(k2,s2);
title("s[k] échantillonné sur 27 points")
xlabel("k")
ylabel("s[k]")

subplot(2,2,3); % Tracé en bas à gauche dans la fenêtre du signal 3
stem(k3,s3);
title("s[k] échantillonné sur 27 points")
xlabel("k")
ylabel("s[k]")

subplot(2,2,4); % Tracé en haut à droite dans la fenêtre du signal 4
stem(k4,s4);
title("s[k] échantillonné sur 27 points")
xlabel("k")
ylabel("s[k]")


