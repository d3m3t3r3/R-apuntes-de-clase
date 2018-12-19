# Sobre documentos incrustados con arreglos
library(mongolite)

mongourl <- "mongodb://<USER>:<PASSWORD>@test..."

inventario_data <- c( 
  '{ "item": "journal", "instock": [ { "warehouse": "A", "qty": 5 }, { "warehouse": "C", "qty": 15 } ] }',
  '{ "item": "notebook", "instock": [ { "warehouse": "C", "qty": 5 } ] }',
  '{ "item": "paper", "instock": [ { "warehouse": "A", "qty": 60 }, { "warehouse": "B", "qty": 15 } ] }',
  '{ "item": "planner", "instock": [ { "warehouse": "A", "qty": 40 }, { "warehouse": "B", "qty": 5 } ] }',
  '{ "item": "postcard", "instock": [ { "warehouse": "B", "qty": 15 }, { "warehouse": "C", "qty": 35 } ] }'
)

inventario <- mongo("inventario_arraysembdoc", url = mongourl)
inventario$insert(inventario_data)
