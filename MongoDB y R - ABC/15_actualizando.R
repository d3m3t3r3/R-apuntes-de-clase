library(mongolite)

mongourl <- "mongodb://<USER>:<PASSWORD>@test..."

subjects <- mongo("subjects", url = mongourl)
subjects$drop()
str <- c('{"name" : "jerry"}' , '{"name": "anna", "age" : 23}', '{"name": "joe"}')
subjects$insert(str)

subjects$find('{}')

subjects$update('{"name":"jerry"}', '{"$set":{"age": 31}}')

subjects$find('{}')
