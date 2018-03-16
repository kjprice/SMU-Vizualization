library(countrycode)
#read data
guns = read.csv('../data/World firearms murders and ownership - Sheet 1.csv',header=TRUE)
suicides = read.csv('../data/Suicide.csv',header=TRUE)
gdp = read.csv('../data/weoreptc.aspx',header=TRUE,sep="\t")
lat_lon = read.csv('../data/LatitudeLongitude.csv',header=TRUE)

#subset only needed columns
gdp = gdp[c('Country','X2017')]
suicides = suicides[c(1,3)]
guns = guns[c(1,6:9)]
lat_lon = lat_lon[c(2:4)]

#change column names
colnames(guns) = c('Country','Homicide per 100k',"Rank by gun ownership",'Guns per 100','Total guns')
colnames(suicides) = c('Country','Suicide per 100k')
colnames(gdp) = c('Country','GDP $ per capita')
colnames(lat_lon) = c("Latitude", 'Longitude', 'Country')

#get country code by country name
guns$code = countrycode(guns$Country,"country.name", "iso3c")
#add code for Kosovo
guns$code[guns$Country=='Kosovo']='KOS'

#change column types
guns[,1] = sapply(guns[,1], as.character)
guns[,2:5] = sapply(guns[,2:5], as.numeric)

#we have separate england, scotland and nothern ireland. We will take average of them
guns$Country[guns$Country=='Scotland']="Great Britain"
guns$`Homicide per 100k`[guns$Country=='Great Britain']=(guns$`Homicide per 100k`[guns$Country=='Northern Ireland']+guns$`Homicide per 100k`[guns$Country=='England and Wales'])/2
guns$`Rank by gun ownership`[guns$Country=='Great Britain']=(guns$`Rank by gun ownership`[guns$Country=='Northern Ireland']+
  guns$`Rank by gun ownership`[guns$Country=='England and Wales']+guns$`Rank by gun ownership`[guns$Country=='Great Britain'])/3
guns$`Guns per 100`[guns$Country=='Great Britain']=(guns$`Guns per 100`[guns$Country=='Northern Ireland']+
                                                               guns$`Guns per 100`[guns$Country=='England and Wales']+guns$`Guns per 100`[guns$Country=='Great Britain'])/3
#take total for this column
guns$`Total guns`[guns$Country=='Great Britain']=guns$`Total guns`[guns$Country=='Northern Ireland']+
                                                      guns$`Total guns`[guns$Country=='England and Wales']+guns$`Total guns`[guns$Country=='Great Britain']

#create code for great britain
guns$code[guns$Country=='Great Britain']='GBR'
#delete columns for 'Nothern Ireland' and 'England and Wales'
guns = guns[!is.na(guns$code),]


#get country code by country name
suicides$code = countrycode(suicides$Country,"country.name", "iso3c")
gdp$code = countrycode(gdp$Country,"country.name", "iso3c")

#add country code for Kosovo and Micronesia
gdp$code[gdp$Country=='Kosovo']='KOS'
gdp$code[gdp$Country=='Micronesia']='FSM'

#get country code by country name
lat_lon$code = countrycode(lat_lon$Country,"country.name", "iso3c")
#add country code for Kosovo, Netherlands Antilles and Micronesia
lat_lon$code[lat_lon$Country=='Kosovo']='KOS'
lat_lon$code[lat_lon$Country=='Micronesia']='FSM'
lat_lon$code[lat_lon$Country=='Netherlands Antilles']='NTA'


#merge data on country
gs = merge(guns, suicides, by='code')
gsg = merge(gs, gdp, by='code')
gsgll = merge(gsg, lat_lon, by='code')

#delete duplicate columns
gsgll = gsgll[,c(1:6,8,10:12)]

colnames(gsgll)=c('Code','Country','Homicide per 100k',"Rank by gun ownership", "Guns per 100", 
                  "Total guns", "Suicide per 100k", "GDP","latitude",	"longitude")


#delete comma and change column type for gdp
gsgll$GDP = as.numeric(gsub(",", "" ,gsgll$GDP))

#add column 'developed' if GDP per capita exceeds 12k - yes, otherwise - no
gsgll$Developed=ifelse(gsgll$GDP>=12000, 'yes','no')

#delete countries without gdp
gsgll = gsgll[!is.na(gsgll$GDP),]

#replace homicide na with median
gsgll$`Homicide per 100k`[is.na(gsgll$`Homicide per 100k`)] = median(gsgll$`Homicide per 100k`[!is.na(gsgll$`Homicide per 100k`)])

#delete countries without known guns status
gsgll = gsgll[!is.na(gsgll$`Guns per 100`),]

write.csv(gsgll, '../data/newData.csv', row.names = FALSE)