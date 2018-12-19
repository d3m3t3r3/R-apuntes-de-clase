library(mongolite)
library(ggplot2)

mongourl <- "mongodb://<USER>:<PASSWORD>@test..."

View(diamonds)

dmd <- mongo(collection = "diamonds", url = mongourl)
dmd$insert(diamonds)

dmd$count()

# Contar todos los registros
dmd$count('{}')

# Cargar todos los datos a una variable en memoria de R
todoslosdatos <- dmd$find(query = '{}' )
todoslosdatos <- dmd$find('{}' )
print(todoslosdatos)