library(mongolite)

mongourl <- "mongodb://<USER>:<PASSWORD>@test..."

iriscon <- mongo("iris", url = mongourl)
iriscon$insert(iris)

iriscon$find('{}')

iriscon$count('{}')

iriscon$remove('{"Species" : "setosa"}')

iriscon$count('{}')

iriscon$remove('{"Sepal_Length" : {"$lte" : 5}}', just_one = TRUE)

iriscon$count()
