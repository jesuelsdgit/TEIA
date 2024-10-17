
library(ggplot2)
library(dplyr)
library(readr)
library(RColorBrewer)

# Ler o arquivo CSV
dados <- read.csv("C:\\Users\\Professor\\OneDrive - Universidade Federal de Itajubá\\Documentos\\TEIA\\cartão de credito.csv", sep = ";")
#dados <- read.csv("UFRN_2021_2024.csv", sep = ";", fileEncoding = "UTF-8")
# file.choose()

# Filtrar dados por ano
dados <- dados %>%
  filter(data())

# Contar o número de alunos por ano de ingresso
DESCRICAO <- dados %>%
 filter(data = "nome")
