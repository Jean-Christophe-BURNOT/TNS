function [x,h,y_c] = Seq_conv(numFig,N)
   %% Question 1 du TNS_TP3_Ex1
    k_x = 0:1:10; %Vecteur ligne de x[k] 0 a 10
    k_h = 0:1:11; %Vecteur ligne de h[k] 0 à 11
    x = 6-abs(k_x-5); % La sequence x[k]
    h = [zeros(1,5)  abs((5:1:11)-8)-1]; % La séquence h[k] on concatene pour completer avec des zeros au debut
    X = fft(x,N); %TFD N points de X
    H = fft(h,N); %TFD N points de H
    Y_c = X.*H; %Convolution de X et H
    
    y_c = ifft(Y_c,N);%TFD inverse N points de Y_c
    k_y = 0:1:N-1; % Vecteur de notre y_c de taille L+M-1 avec L et M les longueurs des sequences x et h
 
    figure(numFig);hold on;
    
    subplot(3,1,1);hold on;
    title('Séquence x[k]')
    stem(k_x,x);
    xlabel('indice k')
    xlim([0 N-1]);
    
    subplot(3,1,2);hold on;
    title('Séquence h[k]')
    stem(k_h,h);
    xlabel('indice k')
    xlim([0 N-1]);
    
    subplot(3,1,3);hold on;
    title('Séquence y_c[k]')
    stem(k_y,y_c);
    xlabel('indice k')
    xlim([0 N-1]);

    
    
  
    
   
    
end
