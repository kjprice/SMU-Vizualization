library(countrycode)
#read data
guns = read.csv('../data/Guns.csv',header=TRUE)
suicides = read.csv('../data/Suicide.csv',header=TRUE)
gdp = read.csv('../data/weoreptc.aspx',header=TRUE,sep="\t")
lat_lon = read.csv('../data/LatitudeLongitude.csv',header=TRUE)
homicide = read.csv('../data/Homicide.csv',header=TRUE)

#subset only needed columns
gdp = gdp[c('Country','X2017')]
suicides = suicides[c(1,3)]
lat_lon = lat_lon[c(2:4)]

#change column names
colnames(suicides) = c('Country','Suicide per 100k')
colnames(gdp) = c('Country','GDP $ per capita')
colnames(lat_lon) = c("Latitude", 'Longitude', 'Country')

#get country code by country name
guns$code = countrycode(guns$Country,"country.name", "iso3c")
#add code for Transnistria
guns$code[guns$Country=='Transnistria']='TRAN'

#change country column to character type
guns[,2] = sapply(guns[,2], as.character)


#get country code by country name
suicides$code = countrycode(suicides$Country,"country.name", "iso3c")
gdp$code = countrycode(gdp$Country,"country.name", "iso3c")


#add country code for Kosovo and Micronesia
gdp$code[gdp$Country=='Kosovo']='KOS'
gdp$code[gdp$Country=='Micronesia']='FSM'

#get country code
homicide$code = countrycode(homicide$Country,"country.name", "iso3c")
#add country codes
homicide$code[homicide$Country=='Kosovo']='KOS'


#get country code by country name
lat_lon$code = countrycode(lat_lon$Country,"country.name", "iso3c")
#add country code for Kosovo, Netherlands Antilles and Micronesia
lat_lon$code[lat_lon$Country=='Kosovo']='KOS'
lat_lon$code[lat_lon$Country=='Micronesia']='FSM'
lat_lon$code[lat_lon$Country=='Netherlands Antilles']='NTA'


#merge data on country
gs = merge(guns, suicides, by='code')
gsg = merge(gs, gdp, by='code')
gsgh = merge(gsg, homicide, by='code')
gsghll = merge(gsgh, lat_lon, by='code')

#delete duplicate columns
gsghll = gsghll[,c(1:4,6,8,10:12)]

colnames(gsghll)=c('Code','Rank by gun ownership', 'Country',"Guns per 100","Suicide per 100k","GDP",'Homicide per 100k',
                   "latitude",	"longitude")


#delete comma and change column type for gdp
gsghll$GDP = as.numeric(gsub(",", "" ,gsghll$GDP))

#add column 'developed' if GDP per capita exceeds 12k - yes, otherwise - no
gsghll$Developed=ifelse(gsghll$GDP>=12000, 'yes','no')

#delete countries without gdp
gsghll = gsghll[!is.na(gsghll$GDP),]

#trim white spaces
gsghll$Country = gsub(" ", "" ,gsghll$Country)


write.csv(gsghll, '../data/newData.csv', row.names = FALSE)