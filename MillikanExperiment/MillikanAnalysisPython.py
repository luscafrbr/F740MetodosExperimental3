### CÓDIGO POR VINICIUS
import pandas as pd
from google.colab import files

# FAZENDO UPLOAD O ARQUIVO
# Fazer o upload do arquivo CSV
uploaded = files.upload()

# Verificar o nome do arquivo carregado
for filename in uploaded.keys():
    print(f'Arquivo enviado: {filename}')

# Ler o arquivo CSV usando pandas, substituindo 'filename' pelo nome do arquivo carregado
df = pd.read_csv(filename)

# Mostrar os primeiros dados do dataframe
print(df.head())

### CALCULANDO AS SUBTRAÇÕES ENTRE AS CARGAS E PLOTANDO
import matplotlib.pyplot as plt

# Carregando o vetor de cargas e o vetor de incertezas:
Q = df['Carga (C)'].tolist()  # Converte a coluna em uma lista
incertezas_Q = df['Incerteza (ictz)'].tolist()  # Converte a coluna em uma lista

# verificar se duas cargas são iguais dentro da incerteza
def cargas_iguais(Q, incertezas_Q):
    cargas_parecidas = []
    for i in range(len(Q)):
        for j in range(i + 1, len(Q)):
            # Incerteza na diferença (propagação de incertezas)
            incerteza_diferenca = np.sqrt(incertezas_Q[i]**2 + incertezas_Q[j]**2)
            if abs(Q[i] - Q[j]) <= incerteza_diferenca:
                cargas_parecidas.append((Q[i], Q[j]))
    return cargas_parecidas

# armazenar as subtrações de cargas
subtracao_cargas = []

# subtrair todas as cargas umas das outras (sem subtração própria)
for i in range(len(Q)):
    for j in range(i + 1, len(Q)):  # Começar de i + 1
        subtracao_cargas.append(Q[j] - Q[i])  # Subtrair na ordem correta

# Exibir o resultado das subtrações
print("Subtração de todas as cargas umas das outras (sem subtração própria):", subtracao_cargas)

# Ordenar as subtrações
subtracao_cargas.sort()
print("Subtrações ordenadas:", subtracao_cargas)

# Plotar o histograma das subtrações de cargas
plt.hist(subtracao_cargas, bins=10)  # Definir o número de bins para uma visualização melhor
plt.xlabel("Diferença de Carga (C)")
plt.ylabel("Número de gotas")
plt.title("Histograma das Subtrações de Cargas")
plt.show()

# FAZ O PLOT DOS DADOS COM UMA GAUSSIANA, APÓS AS SUBTRAÇÕES NECESSÁRIAS:
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

# Assuming difs is your data
# Compute mean and standard deviation of difs
mean = np.mean(difs)
std_dev = np.std(difs)

# Create histogram
plt.hist(difs, bins=50, density=True, alpha=0.6, color='g', label='Data')

# Generate values for the Gaussian curve
x = np.linspace(min(difs), max(difs), 1000)
gaussian_curve = norm.pdf(x, mean, std_dev)

# Plot the Gaussian curve
plt.plot(x, gaussian_curve, 'r-', label=f'Gaussian Fit (mean={mean:.3e}, std={std_dev:.3e})')

# Add a vertical line at the mean value
plt.axvline(mean, color='b', linestyle='--')

# Add labels and title
plt.xlabel('Difference')
plt.ylabel('N')
plt.title('Histogram with Gaussian Fit')

# Add a legend
plt.legend()

# Show the plot
plt.show()