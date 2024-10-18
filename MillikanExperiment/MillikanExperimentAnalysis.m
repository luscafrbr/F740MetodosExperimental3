%% constantes:
% a = raio da gota
g = 9.8; % gravidade (m/s^2)
d = 7.67*10^(-3); % seaparação do capacitor (placas paralelas) (m)
ro = 886 ; % densidade da gota (kg/m^3)
b = 8.20 *10^3; % constante de ajuste (Pa.m)
pi = 3.141592;

%%
T =   ; % temperatura (celsius)
ni =  ; % viscosidade do ar
P =   ; % pressão em atm
V =   ; % diferença de potencial

% vamo ter valores para:
vf =  ; % velocidade de queda
vr =  ; % velocidade de subida

%% raio da gota a partir da lei de stokes
a = (((b/2*P)^2) + (9*ni*vf/(2*g*ro)))^(1/2) - b/2*P;
% print(a)

%% calculo para a massa
m = 4/3*pi*(a^3)*ro;
% print(m)

%%
E = V/d;
% print(E)

q = m*g(vr+vf)/(E*vr);
% print(q,'C')

%% carregando o dado
cargas = xlsread("G:\Drives compartilhados\F 740 - Grp 3\Experimento Millikan\Dados\Data4AnalysisFinal.xlsx", 1, 'D4:D53');
% cargas*10^-19
cargas = sort(cargas);

%% analisando...
% fazendo um histograma para as contagens:
CargasNormalizadas = cargas/10^-19;

histogram(CargasNormalizadas, 'BinEdges', 0:1:CargasNormalizadas(length(cargas))+1, 'FaceColor', 'blue');
title('(a) Histograma de cargas',  'FontSize', 25);
xlabel('Valor de carga (e-19)',  'FontSize', 25);
ylabel('Contagens',  'FontSize', 25);
set(gca, 'FontSize', 25);  % Define o tamanho da fonte para os números dos eixos

%% fazendo q1 - q2 para todas as cargas
subtracao_cargas = [];
for i = 1:length(cargas)
    for j = i+1:length(cargas)
        subtracao_cargas = [subtracao_cargas, CargasNormalizadas(j) - CargasNormalizadas(i)];
    end
end

subtracao_ordem = sort(subtracao_cargas);

media = mean(subtracao_ordem);
desv = std(subtracao_ordem);

%% histograma para subtrações
histogram(subtracao_ordem, 'BinEdges', 0:0.2:subtracao_ordem(length(subtracao_ordem))+1, 'FaceColor', 'blue');

% bar(cargas);
title('Histograma de cargas');
xlabel('valor de carga x e-19');
ylabel('contagens');

%% vamos separar um conj. de valores
lista1 = [];
lista2 = [];
lista3 = [];
for i = 1:length(subtracao_ordem)
    if subtracao_ordem(i) >= 0.8 && subtracao_ordem(i) <= 2.4
        lista1 = [lista1, subtracao_ordem(i)];
    elseif subtracao_ordem(i) > 2.4 && subtracao_ordem(i) <= 3.8
        lista2 = [lista2, subtracao_ordem(i)];
    elseif subtracao_ordem(i) > 4 && subtracao_ordem(i) <= 5.6
        lista3 = [lista3, subtracao_ordem(i)];
    end
end
media1 = mean(lista1);
desv1 = std(lista1);

media2 = mean(lista2);
desv2 = std(lista2);

media3 = mean(lista3);
desv3 = std(lista3);

%% plotemos o histograma do conj. de valores selecionados

histogram(lista, 'BinEdges', lista(1):0.2:lista(length(lista))+1, 'FaceColor', 'blue');

% bar(cargas);
title('Histograma de cargas');
xlabel('valor de carga x e-19');
ylabel('contagens');

%% fazendo um subplot 
k = 30;
legenda = k;
subplot(2,2,1)
histogram(subtracao_ordem, 'BinEdges', subtracao_ordem(1):0.2:subtracao_ordem(length(subtracao_ordem))+0.3, 'FaceColor', 'blue');
title('(a) Histograma de subtrações de cargas', 'FontSize', k);
xlabel('valor de carga x e-19', 'FontSize', k);
ylabel('contagens', 'FontSize', k);
set(gca, 'FontSize', k);


subplot(2,2,2)
histogram(lista1, 'BinEdges', lista1(1):0.2:lista1(length(lista1))+0.3, 'FaceColor', 'blue');
% Cria a string formatada para a legenda
legenda_str = sprintf('Média(Desvio Padrão): %f(%f)', media1, desv1);
legend(legenda_str, 'FontSize', legenda);
title('(b) Histograma de subtrações de cargas', 'FontSize', k);
xlabel('valor de carga x e-19', 'FontSize', k);
ylabel('contagens', 'FontSize', k);
set(gca, 'FontSize', k);

subplot(2,2,3)
histogram(lista2, 'BinEdges', lista2(1):0.2:lista2(length(lista2))+0.3, 'FaceColor', 'blue');
legenda_str = sprintf('Média(Desvio Padrão): %f(%f)', media2, desv2);
legend(legenda_str, 'FontSize', legenda);
title('(c) Histograma de subtrações de cargas', 'FontSize', k);
xlabel('valor de carga x e-19', 'FontSize', k);
ylabel('contagens', 'FontSize', k);
set(gca, 'FontSize', k);

subplot(2,2,4)
histogram(lista3, 'BinEdges', lista3(1):0.2:lista3(length(lista3))+0.3, 'FaceColor', 'blue');
legenda_str = sprintf('Média(Desvio Padrão): %f(%f)', media3, desv3);
legend(legenda_str, 'FontSize', legenda);
title('(d) Histograma de subtrações de cargas', 'FontSize', k);
xlabel('valor de carga x e-19', 'FontSize', k);
ylabel('contagens', 'FontSize', k);
set(gca, 'FontSize', k);