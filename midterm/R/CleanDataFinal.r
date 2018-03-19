library(countrycode)
#read data
guns = read.csv('../data/Guns.csv',header=TRUE)
suicides = read.csv('../data/Suicide.csv',header=TRUE)
gdp = read.csv('../data/weoreptc.aspx',header=TRUE,sep="\t")
lat_lon = read.csv('../data/LatitudeLongitude.csv',header=TRUE)
homicide = read.csv('../data/Homicide.csv',header=TRUE)
hdi = read.csv('../data/hdi.csv',header=TRUE)
gni = read.csv('../data/gni.csv',header=TRUE)
 

#subset only needed columns
gdp = gdp[c('Country','X2017')]
suicides = suicides[c(1,3)]
lat_lon = lat_lon[c(2:4)]
hdi = hdi[c(2,28)]

#change column names
colnames(suicides) = c('Country','Suicide per 100k')
colnames(gdp) = c('Country','GDP $ per capita')
colnames(lat_lon) = c("Latitude", 'Longitude', 'Country')
colnames(hdi) = c("Country","HDI2015")
colnames(gni)=c("Country","code","gni2016")

#get country code by country name
hdi$code = countrycode(hdi$Country,"country.name", "iso3c")

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


#merge data on code
gs = merge(guns, suicides, by='code')
gsg = merge(gs, gdp, by='code')
gsgh = merge(gsg, homicide, by='code')
gsghll = merge(gsgh, lat_lon, by='code')
gsghllh = merge(gsghll, hdi, by = 'code')
gsghllhg = merge(gsghllh, gni, by = 'code')

#delete duplicate columns
gsghllhg = gsghllhg[,c(1:4,6,8,10:12,15,17)]

colnames(gsghllhg)=c('Code','Rank by gun ownership', 'Country',"Guns per 100","Suicide per 100k","GDP",'Homicide per 100k',
                   "latitude",	"longitude","HDI2015",'gni2016')


#delete comma and change column type for gdp
gsghllhg$GDP = as.numeric(gsub(",", "" ,gsghllhg$GDP))

#add column 'developed' if GDP per capita exceeds 12k - yes, otherwise - no
#https://blogs.worldbank.org/opendata/new-country-classifications-2016
gsghllhg$Developed=ifelse(gsghllhg$gni2016>=12476, 'yes','no')

#delete countries without gdp
gsghllhg = gsghllhg[!is.na(gsghllhg$GDP),]
#delete countries without developed status
gsghllhg = gsghllhg[!is.na(gsghllhg$Developed),]

#trim white spaces
gsghllhg$Country = gsub(" ", "" ,gsghllhg$Country)


write.csv(gsghllhg, '../data/newData.csv', row.names = FALSE)