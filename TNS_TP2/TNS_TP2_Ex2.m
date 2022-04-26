clear variable;
close all;

%% Question 1 : voir fonction Seq2

%% Question 2 
% On a 35 points et on veut 5 périodes de cosinus, on veut nos 35 points
% répartis équitablement donc 35/5 = 7 points par période donc notre f_0 =
% 1/7

question = 3;
switch question
    case 'a'
    N = 35;
    periodes = 5; 
    f_0 = 1/(N/ periodes);
    [k,s] = Seq2(f_0,N);

    case 'd'

    N = 70 ;
    periodes = 5;
    f_0 = 1/(N/ periodes);
    [k,s] = Seq2(f_0,N);
    
    case 3
    
    N = 35;
    periodes = 5.2;
    f_0 = 1/(N/ periodes);
    [k,s] = Seq2(f_0,N);


end