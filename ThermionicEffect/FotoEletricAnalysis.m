%% EFEITO FOTOELÉTRICO ANÁLISE


%% EXPERIMENTO A
% explicar o experimento A
% carregando o dado 
intensidade = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Dado IntensidadeXTensao- EXPERIMENTO A e B.xlsx", 1, 'B48:B52');
tensao = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Dado IntensidadeXTensao- EXPERIMENTO A e B.xlsx", 1, 'C48:C52');

%% fazendo um plot de pontos coletados
%texto = {'Tensão 4,6 V', 'Tensão 5 V', 'Tensão 5,8 V', 'Tensão 7,8 V', 'Tensão 9,1 V', 'Tensão 10  V'};
scatter(tensao, intensidade, 75, 'filled', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); 

% scatter(tensao, corrente);
% legend('Intensidade x Tensão','FontSize', 15);
title('Intensidade (%) x Tensão (em volts) para cor amarela 1a ordem', 'FontSize', 24);
xlabel('Tensão (em volt)','FontSize', 20);
ylabel('Intensidade (%)','FontSize', 20);
% Aumenta o tamanho dos números dos eixos
set(gca, 'FontSize', 20); 

%% EXPERIMENTO B
% explicar o experimento B
tensao = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\DataForAnalysis.xlsx", 1, 'E21:E25');
freq = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\DataForAnalysis.xlsx", 1, 'F21:F25'); % 10^14
freq = freq*10^14;


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
% freq = freq;
% tensao = tensao;
tensao1 = [ones(length(tensao),1) tensao];
Coefs = freq\tensao1; % o operador \ performa a regressão de mínimos quadrados para obter o coef. angular   


%%
% coefs = coeficiente{k};
V = Coefs(2)*freq + Coefs(1); % checar por quê o plot dá errrado a partir daqui
plot(freq, V, 'b', 'LineWidth', 2);
hold on;
scatter(freq, tensao, 75, 'filled', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b');

legend('V = (1,86e-15)v + (1,47e-15)', 'Location', 'best','FontSize', 20)
title('V (em volts) x frequência (em Hz)', 'FontSize', 24);
xlabel('v (em Hz)', 'FontSize', 20);
ylabel('V (em Volts)', 'FontSize', 20);
hold off;

%%

