library(mongolite)

mongourl <- "mongodb://<USER>:<PASSWORD>@test..."

inventario <- mongo("inventario_arrays", url = mongourl)

inventario$find('{"tags":["red","blank"]}')

inventario$find('{"tags": { "$all": ["red","blank"] } }')

inventario$find('{"tags": "red" }')

inventario$find('{"dim_cm": { "$gt": "25"} }')

# Ejercicio
inventario$find('{"dim_cm": { "$lt": "25"}, "tags": "blank" }')

inventario$find('{"dim_cm": { "$gt" :"15", "$lt": "20"} }')

inventario$find('{"dim_cm": { "$elemMatch": { "$gt" :"15", "$lt": "20"} } }')

inventario$find('{"dim_cm.1": {"$gt":"20"} }') 

inventario$find('{"tags": {"$size": 3} }') 

