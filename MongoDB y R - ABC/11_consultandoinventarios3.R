library(mongolite)

mongourl <- "mongodb://<USER>:<PASSWORD>@test..."

inventario <- mongo("inventario_arraysembdoc", url = mongourl)

inventario$find('{"instock": {"warehouse": "A", "qty": 5} }')

inventario$find('{"instock": {"qty": 5, "warehouse": "A" } }')

inventario$find('{"instock.qty":  {"$lte": 20} }')

inventario$find('{"instock.0.qty":  {"$lte": 20} }')

inventario$find('{"instock": {"$elemMatch": {"qty": 5, "warehouse": "A"} } }')

inventario$find('{"instock":{"$elemMatch": {"qty": {"$gt": 10, "$lt": 20} } } }')

inventario$find('{ "instock.qty": { "$gt": 10,  "$lte": 20 } }')

inventario$find('{ "instock.qty": 5, "instock.warehouse": "A" }')
