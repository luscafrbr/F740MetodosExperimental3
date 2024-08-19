% CÓDIGO PARA ANÁLISE DE DADOS E PLOTS DO EXPERIMENTO DE F 740 DE EFEITO
% TERMIÔNICO

% U = R*i
% PASSO 0: CARREGANDO E SALVANDO SEU DADO

% salvando o conjunto de dados dentro de uma célula
data = {}; % crio uma célula vazia

% obs.: as próximas quatro linhas de código precisam ser usadas para a quant. de dados
% que for necessária usá-las.
% corrente = xlsread("C:\Users\lucas\OneDrive\Documents\F740\dados exp terminonica 16 ago.xlsx", 1, 'A5:A16'); % abro os dados que tenho interesse em salvar
% corrente = corrente*10^-6;
% tensao = xlsread("C:\Users\lucas\OneDrive\Documents\F740\dados exp terminonica 16 ago.xlsx", 1, 'B5:B16'); % abro os dados que tenho interesse em salvar
corrente = xlsread("C:\Users\lucas\OneDrive\Documents\F740\f 740.xlsx", 1, 'B30:B40');
corrente = corrente*10^-6;
tensao = xlsread("C:\Users\lucas\OneDrive\Documents\F740\f 740.xlsx", 1, 'A30:A40');

% nos nossos dados do efeito temiônico, a corrente é em microampère
data{4} = [corrente tensao]; % salvo os dados em alguma posição da célula criada anteriormente

% apague o que estiver salvo nas variávels corrente e tensao para salvar
% mais dados:
clear corrente tensao;

% salvando...
folder = "G:\Drives compartilhados\F 740 - Grp 3\Efeito Termiônico\Dados"; % diretório da pasta que deseja salvar
filename = "dadosf740.mat"; % nomedoarquivo.mat
save(fullfile(folder, filename), 'data');

% PASSO 1: CARREGANDO E FAZENDO A REGRESSÃO LINEAR
% carregando o arquivo salvo anteriormente:
load("G:\Drives compartilhados\F 740 - Grp 3\Efeito Termiônico\Dados\dadosf740.mat", '-mat'); 

% CoefAngular = corrente\tensao; % o operador \ performa a regressão de mínimos quadrados para obter o coef. angular



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
