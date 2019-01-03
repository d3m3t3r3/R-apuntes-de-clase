library(RecordLinkage)
library(fastLink)

setwd("C:/Users/diant/OneDrive/Escritorio/Record Linkage")



contratistas <- read.delim("bases/Contratistas_OPS_UNP_2018.csv", encoding = "UTF-8", sep = ",")
dim(contratistas)

primera_letra <- substr(contratistas$NOMBRE.O.RAZON.SOCIAL, 1, 1)

table(primera_letra)
table(primera_letra) %>% sapply(. , choose, k = 2) %>% sum()

# Seleccionar los campos

names(contratistas)


# Segunda Fuente de datos -------------------------------------------------

nombres <- read.csv("bases/BASE_DE_DATOS_DATOS_EMPLEADOS.csv", encoding = "UTF-8")
nombres2 <- read.csv("bases/bases.txt", header = T, sep = "\t")

head(nombres)


# Bloqueo

letra_inicial_nombre <- substr(nombres$NOMBRE.1, 1, 1)
letra_inicial_apellido <- substr(nombres$APELLIDO.1, 1, 1)

tb_nombre <- table(letra_inicial_nombre) # Numero de entidades por bloque
tb_apellido <- table(letra_inicial_apellido)

sapply(tb_nombre, choose, 2) # Número de pares de comparaciones
sapply(tb_apellido, choose, 2)

sapply(tb_nombre, choose, 2) %>% sum() # Total de comparaciones
sapply(tb_apellido, choose, 2) %>% sum()


# Distancias

levenshteinSim("Cristian", "Christian")
levenshteinSim("Cristian", "Cristina")

jarowinkler(c("Cristian", "Christian"),
            c("Cristian", "Cristina"))

soundex(nombres$NOMBRE.1)

# Bloques por disyunciones

pares <- compare.dedup(rbind(nombres,nombres2),
                       blockfld = list(1),
                       strcmp = c(1:4),
                       strcmpfun = levenshteinSim)

pares$pairs


pares1 <- compare.dedup(rbind(nombres,nombres2),
                       phonetic = T,
                       blockfld = 1,
                       strcmp = T,
                       strcmpfun = jarowinkler)

pares$pairs

pares_pesos <- epiWeights(pares1)
pares_pesos$Wdata %>% summary()


resultados <- epiClassify(rpairs = pares_pesos, 0.7)
resultados %>% summary()


# Haciendo todo completo  -------------------------------------------------

pares1 <- fastLink(nombres, nombres2, names(nombres))
nombres[pares1$matches[,1],]
nombres2[pares1$matches[,2],]

