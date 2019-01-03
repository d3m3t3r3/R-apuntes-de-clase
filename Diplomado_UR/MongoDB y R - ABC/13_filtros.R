library(mongolite)
library(ggplot2)

mongourl <- "mongodb://<USER>:<PASSWORD>@test..."

View(diamonds)

dmd <- mongo(collection = "diamonds", url = mongourl)
dmd$insert(diamonds)

dmd$find('{"cut" : "Premium", "price" : { "$lt" : 1000 } }')

dmd$find(
  query = '{"cut" : "Premium", "price" : { "$lt" : 1000 } }'
)

dmd$find(
  query = '{"cut" : "Premium", "price" : { "$lt" : 1000 } }',
  fields = '{"cut" : true, "clarity" : true}'
)

dmd$find(
  query = '{"cut" : "Premium", "price" : { "$lt" : 1000 } }', 
  fields = '{"cut" : true, "clarity" : true}',
  limit = 5
)

# Deshabilitando el ID

dmd$find(
  query = '{"cut" : "Premium", "price" : { "$lt" : 1000 } }', 
  fields = '{"cut" : true, "clarity" : true, "_id": false}',
  limit = 5
)

# Ordenando por variable
dmd$find('{"cut" : "Premium"}', sort = '{"price": -1}', limit = 7)
dmd$find('{"cut" : "Premium"}', sort = '{"price": 1}', limit = 7)
