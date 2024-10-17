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

% bar(cargas);
title('Histograma de cargas');
xlabel('valor de carga x e-19');
ylabel('contagens');

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
lista = [];
for i = 1:length(subtracao_ordem)
%    if subtracao_ordem(i) >= 0.8 && subtracao_ordem(i) <= 2.4
%    if subtracao_ordem(i) > 2.4 && subtracao_ordem(i) <= 3.8
    if subtracao_ordem(i) > 4 && subtracao_ordem(i) <= 5.6
        lista = [lista, subtracao_ordem(i)];
    end
end
mediaLis = mean(lista);
desvLis = std(lista);

%% plotemos o histograma do conj. de valores selecionados

histogram(lista, 'BinEdges', lista(1):0.2:lista(length(lista))+1, 'FaceColor', 'blue');

% bar(cargas);
title('Histograma de cargas');
xlabel('valor de carga x e-19');
ylabel('contagens');
