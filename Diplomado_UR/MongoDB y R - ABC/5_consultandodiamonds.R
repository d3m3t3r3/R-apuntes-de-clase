library(mongolite)
library(ggplot2)

mongourl <- "mongodb://<USER>:<PASSWORD>@test..."
dmd <- mongo(collection = "diamonds", url = mongourl)

dmd$find('{"cut":"Ideal"}' )

dmd$find('{ "color": { "$in": ["D","E","F"] } }')

dmd$find('{ "color": "D", "price": { "$lt": 400} }')

dmd$find('{ "$or": [{ "color":"D" },{ "price": {"$lt":400}  }] }')

dmd$find('{ "cut":"Fair" ,"$or": [{ "color":"D" },{ "price": {"$lt":400}  }] }')
