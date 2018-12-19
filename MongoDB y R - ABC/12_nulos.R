# Datos nulos
library(mongolite)

mongourl <- "mongodb://<USER>:<PASSWORD>@test..."

null_data <- c( 
  '{ "_id": 1, "item": null }',
  '{ "_id": 2 }'
)

nulos <- mongo("nulos", url = mongourl)
nulos$insert(null_data)

nulos$find('{}')

nulos$find('{"item": null}')

nulos$find('{"item": {"$type": "null" } }', '{"_id": true}')

nulos$find('{"item": {"$exists": false } }', '{"_id": true}')
