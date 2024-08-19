% U = R*i
corrente = xlsread("C:\Users\lucas\OneDrive\Documents\F740\f 740.xlsx", 1, 'B30:B40');
tensao = xlsread("C:\Users\lucas\OneDrive\Documents\F740\f 740.xlsx", 1, 'A30:A40');

% CoefAngular = corrente\tensao; % o operadoer \ performa a regressão de mínimos quadrados para obter o coef. angular

corrente = corrente*10^-6;

scatter(tensao, corrente); % plota os pontos circulares do conjunto de dados;
hold on;

corrente = corrente*10^-6;
%%%% i(U) = U*(1/R)

corrente = [ones(length(corrente),1) corrente];
Coefs = corrente\tensao;

i = Coefs(2)*tensao + Coefs(1);
plot(tensao, i);

%%%%%%%%%%%


Ten = CoefAngular*Cor;

% R(U) = U*(1/i) 
% -> ln R = ln (U/i) -> ln R = ln U - ln i (não foi feito)
% i é o coef. angular
R = [];
for i = 1:length(tensao)
    R(i) = tensao(i)/corrente(i);
end

R = R.';

CAng = tensao\R;

R = CAng*tensao;
scatter(tensao, R);
hold on
plot(tensao,R);


% X = [ones(length(x),1) x];
% b = X\y
tensao = [ones(length(tensao),1) tensao];
Coefs = tensao\R;

R = CAng*tensao + Coefs(1);
scatter(tensao, R);
hold on
R = CAng*tensao + Coefs(1);
plot(tensao,R);

% R(i) = U*(1/i) %%%%%%%%%%%%
R = [];
for i = 1:length(tensao)
    R(i) = tensao(i)/corrente(i);
end

R = R.';

corrente = [ones(length(corrente),1) corrente];
Coefs = corrente\R;

R = CAng*corrente + Coefs(1);
scatter(corrente(:,2), R);
hold on
R = Coefs(2)*corrente + Coefs(1);
plot(corrente,R);
