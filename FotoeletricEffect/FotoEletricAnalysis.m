%% EFEITO FOTOELÉTRICO ANÁLISE


%% carregando o dado
intensidade = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Dado 30Ago.xlsx", 1, 'B2:B6');
tensao = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Efeito Fotoelétrico\Dados\Dado 30Ago.xlsx", 1, 'C9:C13');

%% fazendo um plot de pontos coletados
%texto = {'Tensão 4,6 V', 'Tensão 5 V', 'Tensão 5,8 V', 'Tensão 7,8 V', 'Tensão 9,1 V', 'Tensão 10  V'};
scatter(tensao, intensidade, 75, 'filled', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); 

% scatter(tensao, corrente);
% legend('Intensidade x Tensão','FontSize', 15);
title('Intensidade (%) x Tensão (em volts) para cor verde 2a ordem', 'FontSize', 24);
xlabel('Tensão (em volt)','FontSize', 20);
ylabel('Intensidade (%)','FontSize', 20);
% Aumenta o tamanho dos números dos eixos
set(gca, 'FontSize', 20); 

%%
clear tensao;