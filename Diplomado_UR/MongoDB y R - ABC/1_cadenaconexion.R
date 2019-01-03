library(mongolite)

View(mtcars)

mongourl <- "mongodb://<USER>:<PASSWORD>@test..."

# Haciendo conexión al servidor
con <- mongo(collection = "mtcars", url = mongourl)

con$count()
if(con$count() > 0) {
  con$drop()
}
con$count()
con$insert(mtcars)
con$count()

# Consultando los datos
mydata <- con$find()

# Borrando los datos
con$drop()

# Se desconecta de la base de datos cuando se remueve la conexión
rm(con)
gc()
