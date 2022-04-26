function [k,s] = Seq2(f_0,N)
   %% Question 1 du TNS_TP2_Ex2
    k=0:1:34; %Vecteur ligne de 0 a 34
    s = cos(2*pi*f_0*k); % La sequence voulu
    S = fft(s,N);
    delta_f = 1/N;
    %Vecteur de S
    
    f_S = 0:delta_f:1-delta_f;
    
    figure (1);hold on;
    
    title('Séquence s[k] = cos(2*pi*f_0*k)')
    stem(k,s);
    
    figure(2);

    subplot(2,2,1);hold on;
    title('Parties réelles de la TFD N-points de S[n]') 
    stem(f_S,real(S))
    xlabel('f,fréquence réduite');
    legend('Partie réelle de S');


    subplot(2,2,2);hold on;
    title('Parties imaginaires de la TFD N-points de S[n]') 
    stem(f_S,imag(S))
    xlabel('f,fréquence réduite');
    legend('Partie imaginaire de S','Partie imaginaire de X');

    subplot(2,2,3);hold on;
    title('Modules de la TFD N-points de S[n]') 
    stem(f_S,abs(S))
    xlabel('f,fréquence réduite');
    legend('Module de S');

    subplot(2,2,4);hold on;
    title('Phases de la TFD N-points de S[n]') 
    stem(f_S,angle(S))
    xlabel('f,fréquence réduite');
    legend('Phase de S');
end