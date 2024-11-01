clc;
clear all;

tabela = readtable("G:\Drives compartilhados\F 740 - Grp 3\Experimento Gamma\grp3vlg\calibraçãoNa22-31-10.csv");

Energia = table2array(tabela(:,2));
Contagens = table2array(tabela(:,3));

% plot(x, y)
plot(Energia, Contagens);
xlabel('Energia');
ylabel('Canais');

%% plot log: este deve ser feito (exp. 2)
semilogy(Energia, Contagens, 'Linewidth', 2);
title('Contagens x Energia (keV)', 'Fontsize', 20);
xlabel('Energia (keV)', 'Fontsize', 20);
ylabel('Escala Log: Contagens', 'Fontsize', 20);
% Aumenta o tamanho dos números dos eixos
set(gca, 'FontSize', 20); 

%%  fazendo a regressão (exp. 3)
% plotar (deltaE/E)^2 no eico y e (1/E) no x
% não está dando certo o scatter com esses dados (?)
clc;
clear all;

% carregue os dados de (deltaE/E)^2 e 1/E:
tabela = readtable("G:\Drives compartilhados\F 740 - Grp 3\Experimento Gamma\dados\Gamma.xlsx");
scat = readtable("C:\Users\lucas\Downloads\Cleaned_Data_for_Plotting.csv");

deltaEsovbEY = table2array(tabela(:,6));
d = table2array(scat(:,2));
EX = table2array(tabela(:,7));
x = table2array(scat(:,3))
scatter(d, x);
p = polyfit(EX, deltaEsovbEY, 1);

%% plotando retas (sem erros)
reta = p(1)*EX + p(2);

plot(EX, reta, 'b', 'LineWidth', 2); % 1a reta
hold on;
scatter(EX, deltaEsovbEY, 75, 'filled', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b'); % 1o conjunto de pontos

% legend('V = (3,803e-15)\nu - (1,329)', 'Pontos Coletados Aparato he (he)', 'V = (3,119e-15)\nu - (1,063)', 'Pontos Coletados Aparato Eletrômetro do Estado Sólido (EES)', 'Location', 'best','FontSize', 20)
title('reta', 'FontSize', 24);
xlabel('1/E (em Hz)', 'FontSize', 20);
ylabel('(deltaE/E)^2', 'FontSize', 20);
hold off;

