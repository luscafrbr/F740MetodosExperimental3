% CÓDIGO PARA ANÁLISE DE DADOS E PLOTS DO EXPERIMENTO DE F 740 DE EFEITO
% TERMIÔNICO

%% salvando o conjunto de dados dentro de uma célula
% PASSO 0: CARREGANDO E SALVANDO SEU DADO

data = {}; % crio uma célula vazia

% obs.: as próximas quatro linhas de código precisam ser usadas para a quant. de dados
% que for necessária usá-las.
% corrente = xlsread("C:\Users\lucas\OneDrive\Documents\F740\dados exp terminonica 16 ago.xlsx", 1, 'A5:A16'); % abro os dados que tenho interesse em salvar
% corrente = corrente*10^-6;
% tensao = xlsread("C:\Users\lucas\OneDrive\Documents\F740\dados exp terminonica 16 ago.xlsx", 1, 'B5:B16'); % abro os dados que tenho interesse em salvar

corrente = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Termiônico\Dados\Dados23AgoComIncertezas.xlsx", 1, 'AO3:AO35');
corrente = corrente*10^-3; % devemos ter atenção se é em miliampère ou microampère
tensao = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Termiônico\Dados\Dados23AgoComIncertezas.xlsx", 1, 'AN3:AN35');
% scatter(tensao, corrente);

%% 
DataInc{6} = [corrente tensao]; % salvo os dados em alguma posição da célula criada anteriormente

% apague o que estiver salvo nas variávels corrente e tensao para salvar
% mais dados:
clear corrente tensao;

%% colocando em ordem crescente ou corrigindo a variável data para usá-la 
% data = DataInc;
datacorrect = {};

datacorrect{1} = data{5};
datacorrect{2} = data{2};
datacorrect{3} = data{1};
datacorrect{4} = data{4};
datacorrect{5} = data{3};
datacorrect{6} = data{6};

% datacorrect{1} = data{4};
% datacorrect{2} = data{5};
% datacorrect{3} = data{6};

clear data;

data = datacorrect;
DataInc = data;

clear datacorrect;

% data com 50 -> 5.8
% data com 32 -> 5
% data com 33 -> 9.1
% data com 45 -> 7.8
% data com 43 -> 4.6
% data com 37 ->  10.7





%% salvando...
folder = "G:\Drives compartilhados\F 740 - Grp 3\Efeito Termiônico\Dados"; % diretório da pasta que deseja salvar
filename = "DadosIncertezas.mat"; % nomedoarquivo.mat
save(fullfile(folder, filename), 'DataInc');

%% PASSO 1: CARREGANDO E PLOTANDO OS PONTOS COLETADOS
% carregando o arquivo salvo anteriormente:
load("G:\Drives compartilhados\F 740 - Grp 3\Efeito Termiônico\Dados\DadosBons.mat", '-mat'); % dados
load("G:\Drives compartilhados\F 740 - Grp 3\Efeito Termiônico\Dados\DadosIncertezas.mat", '-mat'); % incertezas dos dados 

% acessando valores dentro da célula: data{1,1}(1:12)

%texto = {'Tensão 4,6 V | Corrente 1,985 Ampère', 'Tensão 5 V | Corrente 2,11 Ampère', 'Tensão 5,8 V | Corrente 2,308 Ampère', 'Tensão 7,8 V | Corrente 2,728 Ampère', 'Tensão 9,1 V | Corrente 2,989 Ampère', 'Tensão 10  V | Corrente 3,267 Ampère'};
%texto = {'Tensão 4,6 V', 'Tensão 5 V', 'Tensão 5,8 V'};
% texto = {'Tensão 7,8 V', 'Tensão 9,1 V', 'Tensão 10  V'};

texto = {'Tensão 4,6 V', 'Tensão 5 V', 'Tensão 5,8 V', 'Tensão 7,8 V', 'Tensão 9,1 V', 'Tensão 10  V'};
colors = lines(length(data));  % Gera uma matriz de cores diferentes
for i = 1:length(data)
%    scatter(data{1,i}(length(data{1,i})+1:2*length(data{1,i})), data{1,i}(1:length(data{1,i})),  75, 'filled', 'MarkerEdgeColor', colors(i,:), 'MarkerFaceColor', colors(i,:)); % plota os pontos circulares do conjunto de dados;
    scatter(data{1,i}(length(data{1,i})+1:2*length(data{1,i})), ...
            data{1,i}(1:length(data{1,i})), 75, 'filled', 'MarkerEdgeColor', colors(i,:), 'MarkerFaceColor', colors(i,:)); 
    hold on; 
   
end 
% scatter(tensao, corrente);
legend(texto,'FontSize', 15);
title('Plot de Pontos Coletados: Corrente (em ampère) x Tensão (em volts)', 'FontSize', 24);
xlabel('Tensão (em volts)','FontSize', 20);
ylabel('Corrente (em ampère)','FontSize', 20);
% Aumenta o tamanho dos números dos eixos
set(gca, 'FontSize', 20);  % Define o tamanho da fonte para os números dos eixos


hold off;  % Finaliza o 'hold on' para evitar modificações adicionais no gráfico

%% plotando com incertezas

texto = {'Tensão 4,6 V', 'Tensão 5 V', 'Tensão 5,8 V', 'Tensão 7,8 V', 'Tensão 9,1 V', 'Tensão 10 V'};
colors = lines(length(data));  % Gera uma matriz de cores diferentes

% Loop para plotar cada conjunto de dados com incertezas
for i = 1:length(data)
    tensao = data{1,i}(length(data{1,i})+1:2*length(data{1,i}));  % Dados de tensão
    corrente = data{1,i}(1:length(data{1,i}));  % Dados de corrente

    % Defina suas incertezas para cada conjunto de dados
    % Aqui estou assumindo que você tenha incertezas pré-definidas
    uncertainty_voltage = DataInc{1,i}(length(DataInc{1,i})+1:2*length(DataInc{1,i})); % Exemplo de incerteza de tensão (10% dos valores de tensão)
    uncertainty_current = DataInc{1,i}(1:length(DataInc{1,i}));  % Exemplo de incerteza de corrente (10% dos valores de corrente)

    % Plota os pontos de dispersão com barras de erro
    errorbar(tensao, corrente, uncertainty_current, uncertainty_current, uncertainty_voltage, uncertainty_voltage, ...
             'o', 'MarkerEdgeColor', colors(i,:), 'MarkerFaceColor', colors(i,:), 'LineWidth', 1.5, 'CapSize', 10);
    hold on; 
end 

% Configura a legenda e os rótulos do gráfico
legend(texto, 'FontSize', 15);
title('Plot de Pontos Coletados: Corrente (em ampère) x Tensão (em volts)', 'FontSize', 24);
xlabel('Tensão (em volts)', 'FontSize', 20);
ylabel('Corrente (em ampère)', 'FontSize', 20);

% Aumenta o tamanho dos números dos eixos
set(gca, 'FontSize', 20);  % Define o tamanho da fonte para os números dos eixos

hold off;  % Finaliza o 'hold on' para evitar modificações adicionais no gráfico



%% PASSO 2: FAZENDO A REGRESSÃO LINEAR % falta codar a partir daqui
% Pela Lei de Child, a densidade de corrente é dada por J =
% (2raiz(2)/9)*raiz(e/m)*(V^(3/2))/r*beta^2
% e, então, J = cte*V^(3/2)
% mas J = i/A e, se multiplicar os dois lados por A (área), a gente tem:
% i = cte2*V^(3/2)
% fazendo ln dos dois lados: ln i = ln cte2 + ln V^(3/2) = 
% (3/2)*ln V + ln cte2

%% transformando dados em ln
dataln = {};
for j=1:6
    corrente = data{1,j}(1:length(data{1,j}));
    corrente = corrente.';
    corln = log(corrente);
    
    tensao = data{1,j}(length(data{1,j})+1:2*length(data{1,j}));
    tensao = tensao.';
    tenln = log(tensao);
    
    dataln{j} = [corln tenln];
    
    clear corrente corln tensao tenln;
end
clear corrente corln tensao tenln i j d;
 
%% agora sim: linearizamos depois de deixar em os dados em ln!
for j=1:6
    corrente = dataln{1,j}(1:length(dataln{1,j}));
    corrente = corrente.';
    tensao = dataln{1,j}(length(dataln{1,j})+1:2*length(dataln{1,j}));
    tensao = tensao.';
    tensao = [ones(length(tensao),1) tensao];
    Coefs = tensao\corrente; % o operador \ performa a regressão de mínimos quadrados para obter o coef. angular   
    coeficiente{j} = Coefs;
end

%% regressão com incertezas
for j = 1:6
    corrente = dataln{1,j}(1:length(dataln{1,j}));
    corrente = corrente.';
    tensao = dataln{1,j}(length(dataln{1,j})+1:2*length(dataln{1,j}));
    tensao = tensao.';

    % Suponha que incerteza_corrente seja conhecida
    incerteza_corrente = ...; % definir ou calcular as incertezas da corrente

    % Calcular pesos como o inverso do quadrado das incertezas
    pesos = 1 ./ (incerteza_corrente .^ 2); 

    % Ajuste linear ponderado
    tensao = [ones(length(tensao), 1) tensao]; % matriz de design com termo de constante
    W = diag(pesos); % matriz de pesos diagonal
    Coefs = (tensao' * W * tensao) \ (tensao' * W * corrente); % solução ponderada de mínimos quadrados

    % Cálculo dos resíduos
    residuos = corrente - tensao * Coefs;
    sigma2 = (residuos' * W * residuos) / (length(corrente) - length(Coefs)); % Variância residual (estimativa)

    % Matriz de covariância dos coeficientes
    Cov_b = sigma2 * inv(tensao' * W * tensao);

    % Incertezas dos coeficientes (erro padrão)
    erro_padrao = sqrt(diag(Cov_b));

    coeficiente{j} = Coefs;
    incerteza_coef{j} = erro_padrao; % Armazenando as incertezas dos coeficientes
end


%% plota as retas encontradas com a linearização
for k = 1:6
    coefs = coeficiente{k};
    i = coefs(2)*tensao + coefs(1);
    plot(tensao, i);
    hold on;
    scatter(dataln{1,k}(length(dataln{1,k})+1:2*length(dataln{1,k})), dataln{1,k}(1:length(dataln{1,k})));
    
    hold on;
end
legend(texto);
title('Plot de Pontos Coletados: Corrente (em ampère) x Tensão (em volts)');
xlabel('Tensão (em volts)');
ylabel('Corrente (em ampère)');


%%

    corrente = dataln{1,6}(1:length(dataln{1,6}));
    corrente = corrente.';
    tensao = dataln{1,6}(length(dataln{1,6})+1:2*length(dataln{1,6}));
    tensao = tensao.';
    tensao = [ones(length(tensao),1) tensao];
    Coefs = tensao\corrente; % o operador \ performa a regressão de mínimos quadrados para obter o coef. angular   
    coeficiente{7} = Coefs;
    
    
    coefs = coeficiente{7};
    i = coefs(2)*tensao + coefs(1);
    plot(tensao, i, 'r');
    hold on;
    scatter(dataln{1,6}(length(dataln{1,6})+1:2*length(dataln{1,6})), dataln{1,6}(1:length(dataln{1,6})), 'r');

    title('ln(i) (em ampère) x ln(V) (em volts) para tensão fixa 10 V');
    xlabel('ln(V) (em volts)');
    ylabel('ln (i) (em ampère)');
    
%%
    
    
coefs = coeficiente{7};
i = coefs(2) * tensao + coefs(1);

% Plot da reta em azul com espessura de linha aumentada
plot(tensao, i, 'b', 'LineWidth', 2);  % 'LineWidth' define a espessura da linha
hold on;

% Plot dos pontos de dispersão em azul com tamanho aumentado
scatter(dataln{1,6}(length(dataln{1,6})+1:2*length(dataln{1,6})), ...
        dataln{1,6}(1:length(dataln{1,6})), 'b', 'filled', 'MarkerEdgeColor', 'b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b', 'SizeData', 50); % 'SizeData' aumenta o tamanho dos marcadores

title('ln(i) (em ampère) x ln(V) (em volts) para tensão fixa 10 V');
xlabel('ln(V) (em volts)');
ylabel('ln(i) (em ampère)');

hold off;  % Finaliza o 'hold on' para evitar modificações adicionais no gráfico

%%

coefs = coeficiente{7};
i = coefs(2) * tensao + coefs(1);

% Plot da reta em azul com espessura de linha aumentada
plot(tensao, i, 'b', 'LineWidth', 2);  % 'LineWidth' define a espessura da linha
hold on;

% Plot dos pontos de dispersão em azul com tamanho aumentado
scatter(dataln{1,6}(length(dataln{1,6})+1:2*length(dataln{1,6})), ...
        dataln{1,6}(1:length(dataln{1,6})), 'b', 'filled', 'MarkerEdgeColor', 'b', 'LineWidth', 1.5, 'MarkerFaceColor', 'b', 'SizeData', 50);

% Ajusta o título e os rótulos dos eixos com tamanhos de fonte maiores
title('ln(i) (em ampère) x ln(V) (em volts) para tensão fixa 10 V', 'FontSize', 24);
xlabel('ln(V) (em volts)', 'FontSize', 20);
ylabel('ln(i) (em ampère)', 'FontSize', 20);

% Aumenta o tamanho dos números dos eixos
set(gca, 'FontSize', 20);  % Define o tamanho da fonte para os números dos eixos


hold off;  % Finaliza o 'hold on' para evitar modificações adicionais no gráfico
