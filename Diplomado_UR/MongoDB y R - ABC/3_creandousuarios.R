library(mongolite)

mongourl <- "mongodb://<USER>:<PASSWORD>@test..."

personas_con <- mongo("personas_", url = mongourl)
personas_con$insert('{"name" : "blanca"}')
personas_con$find(query = '{}', fields = '{}')
str <- c('{"name" : "jerry"}' , '{"name": "anna", "age" : 23}', '{"name": "joe"}')
personas_con$insert(str)
personas_con$find(query = '{}', fields = '{}')