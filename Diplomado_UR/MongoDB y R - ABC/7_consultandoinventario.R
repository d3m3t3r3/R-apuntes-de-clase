library(mongolite)

mongourl <- "mongodb://<USER>:<PASSWORD>@test..."

inventario <- mongo("inventario", url = mongourl)

inventario$find('{"size.uom":"in"}')

inventario$find('{"size.h":{ "$lt":"15"}}')

inventario$find('{"size.h":{ "$lt": "15"}, "size.uom": "in", "status": "D" }')


