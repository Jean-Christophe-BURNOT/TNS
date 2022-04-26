clear variables;
close all;

[t,x,K] = Seq2(8,271,25,5,1147,38,-0.0081,0.01205,5000); % Création de la séquence demandée

figure(1)
stem(t,x) % Affichage de la séquence en fonction du temps
xlabel("t (s)")
ylabel("x")

title("Echantillons de x en fonction des dates t = kT_e ")