library(DBI)
library(RMySQL)
library(digest)
library(gWidgets2)
rconn=dbConnect(MySQL(),user="root",
                password="",
                host="127.0.0.1",
                dbname="dataset")
dbListTables(rconn)
dbListFields(rconn, "iris")
result=dbSendQuery(rconn,"select*from iris")
iris=fetch(result)
print(iris)

summary(iris)
sapply(iris[,-5], var)
library(ggplot2)
ggplot(iris,aes(x = Sepal.lenght, y = Sepal.width, col= Class)) + geom_point()
ggplot(iris,aes(x = Petal.lenght, y = Petal.width, col= Class)) + geom_point()

set.seed(200)
k.max <- 10
wss<- sapply(1:k.max,function(k){kmeans(iris[,3:4],k,nstart = 20,iter.max = 20)$tot.withinss})
wss
plot(1:k.max,wss, type= "b", xlab = "Number of clusters(k)", ylab = "Within cluster sum of squares")

icluster <- kmeans(iris[,3:4],3,nstart = 20)
table(icluster$cluster,iris$Class)
