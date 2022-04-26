clear variable;
close all;

%% Question 1 : lecture du signal :


[y,Fs] = audioread('signal15.wav');

%soundsc(y,Fs)

%% 2.2 Question 1 : 

sgram(y,Fs,60,1) %Le premier test a été fait a 70 dB

% On voit que la bande spectrale du bruit s'étend de 3kHz à 6.5kHz
% et celle du signal de 0 à 3kHz. Le bruit et le signal
%sont disctinct en fréquences (dit en séance)


%% 2.2 Question 2 :

% Pour retrouver le signal on choisit de synthétiser un filtre
% Passe-bas, en effet notre signal s'étend de 0 à 3kHz

% On veut notre signal jusqu'a 2.9kHz et on a Fs ( ou nue)
% Qui vaut 16kHz
% On a en fréq réduites 2.9/16 = 0.1813

%% 3.1 Question 1 :
question = 4;
switch question
    
    case 1 
    

        N = 41 ;% L'ordre du filtre;
        W_n = (2500)/Fs; %ancienne Fc = 2900 % La fréquence de coupure n'a pas besoin d'être divisé par deux car on travaille deja sur une freq div par 2;
        ftype ='low'; % Type de filtre;
        window = rectwin(N+1); 
        b = fir1(N,W_n,ftype,window);



        %On générer la réponse impulsionnelle
        %Le diagramme pôle zéro et la gain complexe et la phase
        % On a également la somme des a_l qui vaut 1  car nous somme sur un RIF.
        a = [1 zeros(1,41)];
        [G,w] = freqz(b,a,512);




        figure(2);
        subplot(2,2,1);hold on;
        title('Diagramme pôles-zéros du filtre a fenêtre rectangulaire')

        zplane(roots(b))

        subplot(2,2,2);hold on;
        title('Réponse impulsionnelle du filtre a fenêtre rectangulaire')
        stem(0:1:41,b)
        xlabel('indices k')


        subplot (2,2,3);hold on;
        title('Module du gain complexe en dB du filtre a fenêtre rectangulaire')
        f = Fs*w/(pi); % Fréquence réelle w sur  2*pi
        plot(f,abs(G))
        xlabel('fréquence réelle f')
        ylabel('Gain linéaire')

        subplot (2,2,4); hold on;
        title('Phase du gain complexe du filtre a fenêtre rectangulaire')

        plot(f,unwrap(angle(G))) % unwrap corrige les discontinuité supérieur a pi or on n'en a pas.
        xlabel('fréquence réelle f')
        ylabel('Phase en radian')

%% 3.2 Question 1

% On reprend la méthode précedente avec plusieurs filtres
% Hamming, Hanning, Blackman 

    case 2 


        N = 41 ;% L'ordre du filtre;
        W_n = (2900*2)/Fs; % La fréquence de coupure n'a pas besoin d'être divisé par deux car on travaille deja sur une freq div par 2;
        ftype ='low'; % Type de filtre;
        window = hamming(N+1); 
        b = fir1(N,W_n,ftype,window);



        %On générer la réponse impulsionnelle
        %Le diagramme pôle zéro et la gain complexe et la phase
        % On a également la somme des a_l qui vaut 1  car nous somme sur un RIF.
        a = [1 zeros(1,41)];
        [G,w] = freqz(b,a,512);




        figure(2);
        subplot(2,2,1);hold on;
        title('Diagramme pôles-zéros du filtre a fenêtre Hamming')

        zplane(roots(b))

        subplot(2,2,2);hold on;
        title('Réponse impulsionnelle du filtre a fenêtre Hamming')
        stem(0:1:41,b)
        xlabel('indices k')


        subplot (2,2,3);hold on;
        title('Module du gain complexe en dB du filtre a fenêtre Hamming')
        f = Fs*w/(2*pi); % Fréquence réelle w sur  2*pi
        plot(f,1*(abs(G)))
        xlabel('fréquence réelle f')
        ylabel('Gain linéaire')

        subplot (2,2,4); hold on;
        title('Phase du gain complexe du filtre a fenêtre Hamming')

        plot(f,unwrap(angle(G))) % unwrap corrige les discontinuité supérieur a pi or on n'en a pas.
        xlabel('fréquence réelle f')
        ylabel('Phase en radian')

    case 3
        
        
        
        N = 41 ;% L'ordre du filtre;
        W_n = (2900*2)/Fs; % La fréquence de coupure n'a pas besoin d'être divisé par deux car on travaille deja sur une freq div par 2;
        ftype ='low'; % Type de filtre;
        window = hanning(N+1); 
        b = fir1(N,W_n,ftype,window);



        %On générer la réponse impulsionnelle
        %Le diagramme pôle zéro et la gain complexe et la phase
        % On a également la somme des a_l qui vaut 1  car nous somme sur un RIF.
        a = [1 zeros(1,41)];
        [G,w] = freqz(b,a,512);




        figure(2);
        subplot(2,2,1);hold on;
        title('Diagramme pôles-zéros du filtre a fenêtre Hanning')

        zplane(roots(b))

        subplot(2,2,2);hold on;
        title('Réponse impulsionnelle du filtre a fenêtre Hanning')
        stem(0:1:41,b)
        xlabel('indices k')


        subplot (2,2,3);hold on;
        title('Module du gain complexe en dB du filtre a fenêtre Hanning')
        f = Fs*w/(2*pi); % Fréquence réelle w sur  2*pi
        plot(f,1*(abs(G)))
        xlabel('fréquence réelle f')
        ylabel('Gain linéaire')

        subplot (2,2,4); hold on;
        title('Phase du gain complexe du filtre a fenêtre Hanning')

        plot(f,unwrap(angle(G))) % unwrap corrige les discontinuité supérieur a pi or on n'en a pas.
        xlabel('fréquence réelle f')
        ylabel('Phase en radian')
        
    case 4
        
        N = 60 ;% L'ordre du filtre;
        W_n = (2*2500)/Fs; % La fréquence de coupure n'a pas besoin d'être divisé par deux car on travaille deja sur une freq div par 2;
        ftype ='low'; % Type de filtre;
        window = blackman(N+1); 
        b = fir1(N,W_n,ftype,window);



        %On générer la réponse impulsionnelle
        %Le diagramme pôle zéro et la gain complexe et la phase
        % On a également la somme des a_l qui vaut 1  car nous somme sur un RIF.
        a = [1 zeros(1,N)];
        [G,w] = freqz(b,a,512);




        figure(2);
        subplot(2,2,1);hold on;
        title('Diagramme pôles-zéros du filtre a fenêtre Blackman')

        zplane(roots(b))

        subplot(2,2,2);hold on;
        title('Réponse impulsionnelle du filtre a fenêtre Blackman')
        stem(0:1:N,b)
        xlabel('indices k')


        subplot (2,2,3);hold on;
        title('Module du gain complexe en dB du filtre a fenêtre Blackman')
        f = Fs*w/(2*pi); % Fréquence réelle w sur  2*pi
        plot(f,abs(G))
        xlabel('fréquence réelle f')
        ylabel('Gain linéaire')

        subplot (2,2,4); hold on;
        title('Phase du gain complexe du filtre a fenêtre Blackman')

        plot(f,unwrap(angle(G))) % unwrap corrige les discontinuité supérieur a pi or on n'en a pas.
        xlabel('fréquence réelle f')
        ylabel('Phase en radian')
        
    
        
end


%On a la réponse impulsionnelle du filtre G 

sig_filt = filter(b,a,y);
test=0;

soundsc(sig_filt,Fs)

sgram(sig_filt,Fs,60,3)

%"la bas il y a de mauvaises vagues très hautes"
% On change la fréquence de coupure de 2900 a 2500 pour ne plus entendre le
% bruit
% On augmente le nombre de points M pour avoir un audio plus clair







