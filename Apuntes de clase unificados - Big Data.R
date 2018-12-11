# Introducción ------------------------------------------------------------

# Esta guía se construye con el aporte de todos los asistentes
# al diplomado en -Analítica y Big Data- de la Universidad del
# Rosario impartido a integrantes del GRAI.

# La guía es abierta y construida como obra abierta para que
# cualquiera pueda compartirla, modificarla, mejorarla y participar
# compartiendo conocimiento, aprendiendo o repasando.


# Reglas de estilo --------------------------------------------------------

# Si considera que debe aplicarse una regla de estilo útil
# escribala a continuación como comentario. Gracias.

# 1.


# Herramientas de estilo --------------------------------------------------

# Jerarquía de secciones si tiene cuatro veces seguidas '-', '=' o '#' al final
# Ejemplo:
# Sección uno --------------------
# Sección dos ====================
# Sección tres ################

# Codigos útiles ----------------------------------------------------------

demo(graphics) #enter para ver todos los graficos posibles de R
rm() #para borrar todos los objetos 
install.packages("MASS") #Se recomienda instalar paquetes (libraries) al inicio del código

# Teclas rápidas (hotkeys)
# Ctrl+Shift+r = Crear sección
# Alt+- = Asignar valor '<-' 
# Ctrl+L = Borrar la consola

# Cambiando directorio de trabajo -----------------------------------------

2+2
library(MASS)
x<-2+2 #Comentario (Con el sìmbolo '#' se definen comentarios, los comentarios no se tienen en cuenta en la ejecución)
x <- 4
ls()
dir()
getwd()
setwd("C:/")
getwd()
list.files("/") #Para enlistar los archivos que estan dentro de la carpeta
list.dirs("/") #Para enlistar las carpetas, enlista todos los archivos y carpetas

# primeros_comandos -------------------------------------------------------
x <- 2+2 #Comando de asignación
print(x)
x*3
x/0
x <-2+6
print(x)
z <- 10-5
x+z

# secuecias de numeros ----------------------------------------------------

#Ejemplo 1
y <- 1:30 #Poner dos puntos, para que la secuencia vaya de 1 en 1
print(y)
y <- seq(1,30,by=0.3)
hola
"hola"
z <- "hola"

#Ejemplo 2
y <- 1:20
print(y)
w <- seq(2,100, by=8)
print(w)
hola
"hola"
z <- "hola"

# clases_atomicas ---------------------------------------------------------
# Tipos de Objetos
class("hola") #Para saber el tipo de objeto que es
class(2)
class(2:6)
class(TRUE)

# Vectores ----------------------------------------------------------------
# Ejemplo 1
x <- c(1,2)
x
c(1,3,4) 
c("a", "b", "c")
c(TRUE, FALSE)
c(1, 3, TRUE)
c("a", 2, 3)
#Variables de tipo factor
w <- factor(c("a", "b", "c", "c", "b"))
w
#Para preguntar de que tipo es alguna cosa
is.numeric(x)
#Cambiar el tipo de factor. Con la palabra as cambiamos el tipo
class(w)
ww <- as.character(w)
class(ww)

# Ejemplo 2
c(2,3, 7)
c(TRUE, FALSE)
c(2,3, TRUE)
c("a", "b", "c")
c("a", 2, 3)
i <- factor(c("a", "b", "c", "c", "b"))
i
# As Character
class(w)
ww <- as.character(w)
ww

# Matrices ----------------------------------------------------------------

#Vector: Identifica un punto en una matriz
#Matriz: Filas por columnas
#Estadística: Básicamente es algebra lineal
#Datos categóricos: Se leen como matrices
#Vectores con letras minúsculas
#Matrices con mayusculas

# Ejemplo 1
A <- matrix(1:10, nrow = 5) #nrow es el numero de filas
A
A <- matrix(1:10, ncol = 5)
A
dim(A)
t(A) #Se pone la letra t para transponer
cbind(A, c(11, 12)) #Para pegar columnas se pone C de columna y bind
rbind(A, 11:15) # Aquí se agrega fila
B <- matrix(0:19, nrow = 4)
B
C <- matrix(seq(-40, -2, by = 2), nrow = 5) #matriz de tamaño 5X4 con los numeros pares negativos
C

# Ejemplo 2
A <-matrix(1:10, 5)
B <- matrix(1:40, ncol=10)
A
B
dim(B)
B
t(B) #Trasponer convierte filas en columnas o a la inversa
#B*B la trasponde, es como elevarla al cuadrado
#Sumar una columna
A
cbind(A, c(11,12,13,14,15))
A

# Ejercicio 1 crear matriz de 4*5 con los numeros del 0 al 20, crear una matriz de 5*4 con número pares negativos
E1 <- matrix(0:19, 5)
E1
E2 <- matrix(seq(-40,-2,by=2), 4)
E2


# Listas ------------------------------------------------------------------
# Lista: Permite incluir datos sin restricciones de valor o texto
# Lista: Permite unir vector con matriz
#Ejemplo 1
a <- list("a",2)
b <- list(A,x)
#Ejemplo 2
L1 <- list("a",5,"ok",10)
L1

# Acceso a elementos de objetos -------------------------------------------
# Acceso con paréntesis cuadrados a datos específicos de objetos
L1[3]
L1

B[3,7]

x <- matrix(2:21, 5)
x
x <- list(2,4,7,8,3,4,5,6,7)
x
x[1]

a <- 5
b <- 9
d <- 15
e <- 5

# Operadores lógicos ------------------------------------------------------
# Ejemplo 1
x <- 3
y <- 8
x<y
x>y
z <- 3
x <= z
x >= z
x == y #Doble igual para comparar
x != y # Diferente. El signo de admiraciÃ³n es para negar
(x < y) & (z >x)
(x < y) | (z >x)

# Ejemplo 2
a<b #menor
a>d #mayor
a<=e #Menor o igual
e>=d #Mayor o igual
a==e #Igual
a==b #Igual
a!=e #Negación de la igualdad
!(a!=e) #Negación de la negación de igualdad

# Tablas de verdad 
(a<b) & (a<=e) #F&V=F, V&V=V, F&F=F, V&F=F (el 'y')
(a<b) | (a<=e) #F&F=F, V&F=V, F&V=V, V&V=V (el 'o')


# Dataframes --------------------------------------------------------------

iris
class(iris)
view(iris)
head(iris,3)
names(iris)
iris$Petal.Length
class(iris$Sepal.Length)
iris[, 1]
class(iris["Sepal.Length"])

# con CLass se deja en un vector
# con el sólo llamado sin class llama datos y almacena pero no en vector

# Comandos útiles ---------------------------------------------------------
# Ejemplo 1
x <- "hola"
y <- "Estamos en el curso de analitica de datos"
nchar(x)# Para saber cuantos elementos tiene 
nchar(y)
w <- strsplit(y," ")#Para separar partes d eun texto
gsub("a", "A", y) #Cambia las letras. por ejemplo a minuscula pr mayuscula
w[[1]]
grep("a", w[[1]])#busca la posiciÃ³n
grepl("a", w[[1]])#Valida si es cierto 
class(w)
z <- c("hola estamos en el curso", "en la univeesidad del rosario")
strsplit(z," ")#separa cada vez que encuentre un espacio

#Ejemplo 2
sub_baseA <- subset(iris, Sepal.Length > 5)
sub_baseB <- subset(iris, Species == "virginica")
dim(sub_baseA)
dim(sub_baseB)
rownames(iris)
gsub("h", "p", "hola") #Cambio de expresiones regulares de h por p en toda la base
h <- "hola"
i <-"Estamos en el curso de analitica de datos"
nchar(h)
nchar(i)
w <- strsplit(i, " ")
class(w)
w
i

# Sentencias lógicas ------------------------------------------------------
# Ejemplo 1
x <- 3
if (x>5){
  x <- x/2
  y <- 2*x
} else {
  x <- 2*2
  y <- x
}
x
y
# Ejemplo 2
f <- 10
if(f>5){print("el numero es mayor que cinco")}else{print("el numero es menor que cinco")}
g <- 10
if(g>5){g <- g/2;h <- 2*g}else{g <- 2*2;h <- g}

#I conjunto de indices
#loops

# Ciclos ------------------------------------------------------------------
# En este caso i toma valores del 1 al 6
for (i in 1:6) {
  print(paste("Soy el número", i))
}
x <- c()
for (k in 1:30) {
  x[k] <- k*4
  print(k)
}
x

# While -------------------------------------------------------------------
x <- 8
while (x < 30) {
  x <- x + 1
  print(x)
}

# Ejercicio ---------------------------------------------------------------
z <- list("Mathias", "y", "sarai", "soto", "Ochoa", "son", "hijos", "de", "Danilo", "Soto", "Becerra", "y", "cielo", "ochoa", "salcedo")
class(z)
m <- c()
for (k in 1:15) {
  m[k] <- nchar(z[[k]])
  print(z[[k]])
}
m  
#Se creo una lista de  15 palabras, y luego se aplico un ciclo que recorre la lista y calcula el numero de letras en cada una de las palabras, luego se guardo como vector,
summary(m)#estas son las estadìsticas
i <- 1
z
while (!(grepl("j",z[[i]]))) {
  i <- i+1
}
print(i)
# loops -------------------------------------------------------------------
# FALTAN APUNTES EN LOOPS


# Funciones ---------------------------------------------------------------
potencia <- function(x, y){
  u <- 2*x+y
  w <- x^y
  return(list(primera=u, segunda = w)) #Return para volver o decir para que necesito que me devuelva
}
potencia(3, 9)

myfun <- function(x){
  if(x>5){
    x <- x/2
    y <- 2^x
  } else{
    x <- 2*2
    y <- -x
  }
  list(x=x,y=y)
}
myfun(3)

# Importar bases de datos -------------------------------------------------
# FALTAN APUNTES EN IMPORTACIÓN DE BASES DE DATOS

