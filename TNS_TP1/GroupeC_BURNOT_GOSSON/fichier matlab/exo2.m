clear variables;
close all;

[t,x,K] = Seq2(8,271,25,5,1147,38,-0.0081,0.01205,5000); % Cr�ation de la s�quence demand�e

figure(1)
stem(t,x) % Affichage de la s�quence en fonction du temps
xlabel("t (s)")
ylabel("x")

title("Echantillons de x en fonction des dates t = kT_e ")