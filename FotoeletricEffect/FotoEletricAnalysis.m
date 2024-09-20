%% EFEITO FOTOELÉTRICO ANÁLISE

%% EXPERIMENTO A
% explicar o experimento A
% carregando o dado 
% h/e setup
IntensidadeVerde = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'A3:A7');  
TensaoVerde = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'B3:B7');
IncertezaVerde = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'D3:D7');

IntensidadeAmarelo = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'A11:A15');
TensaoAmarelo = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'B11:B15');
IncertezaAmarelo = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'D11:D15');

% eletrômetro setup
IntensidadeVerde = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'B35:B39');  
TensaoVerde = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'C35:C39');
IncertezaVerde = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'D35:D39');

IntensidadeAmarelo = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'B41:B45');
TensaoAmarelo = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'C41:C45');
IncertezaAmarelo = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'D41:D45');


%% fazendo um plot de pontos coletados
%texto = {'Tensão 4,6 V', 'Tensão 5 V', 'Tensão 5,8 V', 'Tensão 7,8 V', 'Tensão 9,1 V', 'Tensão 10  V'};
scatter(IntensidadeVerde, TensaoVerde, 75, 'filled', 'MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g'); 
hold on;
scatter(IntensidadeAmarelo, TensaoAmarelo, 75, 'filled', 'MarkerEdgeColor', 'y', 'MarkerFaceColor', 'y');

% scatter(tensao, corrente);
legend('Cor Verde', 'Cor Amarelo', 'FontSize', 15);
title('Tensão (em volts) x Intensidade (%) para 1a ordem', 'FontSize', 24);
xlabel('Intensidade (%)','FontSize', 20);
ylabel('Tensão (em volt)','FontSize', 20);
% Aumenta o tamanho dos números dos eixos
set(gca, 'FontSize', 20); 
hold off;

%% fazendo um plot de pontos coletados (com incertezas) 

errorbar(IntensidadeVerde, TensaoVerde, IncertezaVerde, 'o', 'MarkerEdgeColor', 'g', 'MarkerFaceColor', 'g', 'Color', 'g', 'LineWidth', 1.5, 'CapSize', 10);
hold on;
errorbar(IntensidadeAmarelo, TensaoAmarelo, IncertezaAmarelo, 'o', 'MarkerEdgeColor', 'y', 'MarkerFaceColor', 'y', 'Color', 'y', 'LineWidth', 1.5, 'CapSize', 10);
legend('Cor Verde', 'Cor Amarelo', 'FontSize', 15);
title('Tensão (em volts) x Intensidade (%) para 1a ordem - Aparato Eletrômetro', 'FontSize', 24);
xlabel('Intensidade (%)','FontSize', 20);
ylabel('Tensão (em volt)','FontSize', 20);
% Aumenta o tamanho dos números dos eixos
set(gca, 'FontSize', 20); 
hold off;


%% EXPERIMENTO B
% explicar o experimento B
tensao1 = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'B20:B24');
ErroTensao1 = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'D20:D24');
freq1 = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'C20:C24'); % 10^14
freq1 = freq1*10^14;

tensao2 = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'B50:B54');
ErroTensao2 = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'D50:D54');
freq2 = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Data2Plot.xlsx", 1, 'C50:C54'); % 10^14
freq2 = freq2*10^14;

%%
scatter(freq, tensao, 75, 'filled', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); 

% scatter(tensao, corrente);
% legend(Tensão x Tensão','FontSize', 15);
title('Tensão (V) x Frequência (em Hz) para 1a ordem', 'FontSize', 24);
xlabel('Frequência (em Hz)','FontSize', 20);
ylabel('Tensão (em V)','FontSize', 20);
% Aumenta o tamanho dos números dos eixos
set(gca, 'FontSize', 20); 

%% regressão linear
% equação que rege o fenômeno V = (h/e)v - (W/e)
% fazer mudança manual para p1 ou p2 quando for mudar o conjunto de dados
p2 = polyfit(freq1, tensao1, 1); % returns p for a polynomial p(x) degree n that best fit (in least square sense) for data in y (tensao). 
CtePlanck2 = p2(1)*1.602*10^-19;
CtePlanck1 = p1(1)*1.602*10^-19;

%% regressão linear com erro (here it is working!)
% Suponha que incerteza_corrente seja conhecida
incerteza = ErroTensao2; % definir ou calcular as incertezas da corrente

% Calcular pesos como o inverso do quadrado das incertezas
pesos = 1 ./ (incerteza .^ 2); 

% Ajuste linear ponderado
freq = freq2;
tensao = tensao2;
freq = [ones(length(freq), 1) freq]; % matriz de design com termo de constante
W = diag(pesos); % matriz de pesos diagonal
Coefs = (freq' * W * freq) \ (freq' * W * tensao); % solução ponderada de mínimos quadrados % (x' * W * x) \ (x' * W * y)

% Cálculo dos resíduos
residuos = tensao - freq * Coefs;
sigma2 = (residuos' * W * residuos) / (length(tensao) - length(Coefs)); % Variância residual (estimativa)

% Matriz de covariância dos coeficientes
Cov_b = sigma2 * inv(freq' * W * freq);

% Incertezas dos coeficientes (erro padrão)
erro_padrao = sqrt(diag(Cov_b));

% Cálculo dos valores t para cada coeficiente
t_valores = Coefs ./ erro_padrao;

% Graus de liberdade
gl = length(tensao) - length(Coefs);

% Cálculo dos p-valores associados usando a distribuição t
p_valores = 2 * (1 - tcdf(abs(t_valores), gl));

CtePlanck1 = Coefs(2)*1.602*10^-19;

%% deixando os dados em um struct 
B = [];
B.erro = erro_padrao;
B.coefs = Coefs;
B.pvalor = p_valores;
B.planck = CtePlanck1;
B.text = ['eletrometro'];
%% regressão linear com erro em y
% resultando em valores diferentes (muito diferentes) da função polyfit
% (checar o por quê!)
x = freq1;
y = tensao1;
erro_y = ErroTensao1; % Erros nos dados de y

% Calculando os pesos
weights = 1 ./ (erro_y.^2);

% Função de ajuste linear
linFunc = @(b, x) b(1) * x + b(2); % b(1) = coeficiente angular, b(2) = coeficiente linear

% Estimativa inicial
b0 = [1, 1]; % Inicialização dos coeficientes

% Usando lsqcurvefit para encontrar os coeficientes
options = optimset('Display', 'off'); % Ocultar saída
b = lsqcurvefit(@(b, x) linFunc(b, x), b0, x, y, [], [], options, weights);

% Obtendo a linha de ajuste
y_fit = linFunc(b, x);

%% Plotando os dados e a linha de ajuste
figure;
errorbar(x, y, erro_y, 'o'); % Plotando os dados com erro
hold on;
plot(x, y_fit, '-r', 'LineWidth', 2); % Linha de ajuste
title('Regressão Linear Ponderada com Erros em Y');
xlabel('X');
ylabel('Y');
legend('Dados', 'Ajuste Linear');
hold off;


%% plotando as retas obtidas com erros
% aqui faz o plot das duas retas obtidas e guardadas em p1 e p2 :)
V1 = A.coefs(2)*freq1 + A.coefs(1);
V2 = B.coefs(2)*freq2 + B.coefs(1);

plot(freq1, V1, 'b', 'LineWidth', 2); % 1a reta
hold on;
% 1o conjunto de pontos
errorbar(freq1, tensao1, ErroTensao1, 'o', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b', 'Color', 'b', 'LineWidth', 1.5, 'CapSize', 10);

plot(freq2, V2, 'r', 'LineWidth', 2); % 2a reta
% 2o conjunto de pontos
errorbar(freq2, tensao2, ErroTensao2, 'o', 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'Color', 'r', 'LineWidth', 1.5, 'CapSize', 10);
legend('V = (3,818 \pm 0,186)e-15 \nu - (1,339 \pm 0,123)', 'Pontos Coletados Aparato he (he)', 'V = (3,313 \pm 0,109)e-15 \nu - (1,074 \pm 0,072)', 'Pontos Coletados Aparato Eletrômetro do Estado Sólido (EES)', 'Location', 'best','FontSize', 18)
title('V (em volts) x frequência (em Hz) - 1ª ordem', 'FontSize', 24);
xlabel('\nu (em Hz)', 'FontSize', 20);
ylabel('V (em Volts)', 'FontSize', 20);
set(gca, 'FontSize', 20);  % Define o tamanho da fonte para os números dos eixos

hold off;

%% plotando retas (sem erros)
V1 = p1(1)*freq1 + p1(2);
V2 = p2(1)*freq2 + p2(2);

plot(freq1, V1, 'b', 'LineWidth', 2); % 1a reta
hold on;
scatter(freq1, tensao1, 75, 'filled', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); % 1o conjunto de pontos

plot(freq2, V2, 'r', 'LineWidth', 2); % 2a reta
scatter(freq2, tensao2, 75, 'filled', 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r'); % 2o conjunto de pontos

legend('V = (3,803e-15)\nu - (1,329)', 'Pontos Coletados Aparato he (he)', 'V = (3,119e-15)\nu - (1,063)', 'Pontos Coletados Aparato Eletrômetro do Estado Sólido (EES)', 'Location', 'best','FontSize', 20)
title('V (em volts) x frequência (em Hz) - 1ª ordem', 'FontSize', 24);
xlabel('\nu (em Hz)', 'FontSize', 20);
ylabel('V (em Volts)', 'FontSize', 20);
hold off;

%% salvando...

folder = "G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados";
filename = "RegressaoData.mat";
save(fullfile(folder, filename), 'A', 'B');

 
