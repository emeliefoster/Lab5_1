#fixing alaska excel sheet 
#testing github 
e=readxl::read_xlsx("Alaska.xlsx")
library(stringr)

#fixing lat and long coor in alaksa data
#step 1: split apart the character strings and grab the indivudual pieces
library(stringr)
deg=str_sub(string=e$lat, start=1,end=2)
min=str_sub(string=e$lat, start=5,end=6)
#trying to push it to git 
sec=str_sub(string=e$lat, start=8,end=12)
head(sec)

cardirect=str_sub(string=e$lat, start=13,end=13)
head(cardirect)

#we have to do some math now 
#60 minutes in a degree 
#step 2: convert minutes and seconds to be decimal degree

#converting the values that are in quotes... this puts them from characters to numbers
deg=as.numeric(deg)
min=as.numeric(min)
sec=as.numeric(sec)
#warning messagae here...

min.c=min+sec/60
head(min.c)

deg.c=deg+min/60
head(deg.c)

#now do it for the longitude 

deg.lon=str_sub(string=e$long, start=1,end=2)
min.lon=str_sub(string=e$long, start=5,end=6)
sec.lon=str_sub(string=e$long, start=8,end=12)
head(sec)

cardirect=str_sub(string=e$long, start=13,end=13)
head(cardirect)

#we have to do some math now 
#60 minutes in a degree 
#step 2: convert minutes and seconds to be decimal degree

#converting the values that are in quotes... this puts them from characters to numbers
deg.lon=as.numeric(deg.lon)
min.lon=as.numeric(min.lon)
sec.lon=as.numeric(sec.lon)
#warning messagae here...

min.c.lon=min.lon+sec.lon/60
head(min.c)

deg.c.lon=(deg.lon+min.c.lon/60)*-1
head(deg.c.lon)

#now do it for the longitude
#now, you see the "W"s, you have to change that to a number 
#thats why we multiplies the lon by -1
#Step 3: put them back into the data set.. rn we just have vectors

e$long=deg.c.lon
e$lat=deg.c

e$date <- as.yearmon(paste(e$year, e$month), "%Y %m")
e$date
e$Date <- with(e, sprintf("%d-%02d", e$year, e$month))
within(e, Date <- sprintf("%d-%02d", year, month))             
View(e)
write.csv(x=e,file="C:/Users/Em/Documents/Course Materials/Spring 2021/Data Management/Data/lab 5 data/alaskafixed3.csv",row.names=F)

write.table(e, file="alaska_data", sep="/t", row.names=FALSE)
p=readxl::read_xlsx("Peru.xlsx")
head(p)

a= as.numeric(str_extract(p$LAT, "^[0-9]+"))
b= str_extract(p$LAT, "[0-9]*\\.?[0-9A-Za-z]*$")
c= as.numeric(str_extract(b,"^[0-9]*\\.?[0-9]*"))
View(a)
View(a)
str(c)

min= c/60
deg= (a+min)*-1
p$LAT= deg
View(p)

A= as.numeric(str_extract(p$LONG, "^[0-9]+"))
B= str_extract(p$LONG, "[0-9]*\\.?[0-9A-Za-z]*$")
C= as.numeric(str_extract(b,"^[0-9]*\\.?[0-9]*"))

deg_long= (A+C/60)*-1
head(deg_long)
p$LONG= deg_long
write.csv(x=p, file="peru_fixed")
write.csv(x=p,file="C:/Users/Em/Documents/Course Materials/Spring 2021/Data Management/Data/lab 5 data/perufixed.csv",row.names=F)
write.table(p, file="peru_data", sep="/t", row.names=FALSE)
#fixing gom 
g=read.csv("GOM.csv")
View(g)
g$date <- as.Date(with(g, paste(Year, Month, Day,sep="-")), "%Y-%m-%d")
g$date
write.csv(x=g, file="gom_fixed")

write.table(g, file="gom_data", sep="/t", row.names=FALSE)
write.csv(x=g,file="C:/Users/Em/Documents/Course Materials/Spring 2021/Data Management/Data/lab 5 data/gomfixed.csv",row.names=F)
#processing finished 