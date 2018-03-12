gun.violence = read.csv('../data/GunViolence.csv')

# Turn "12,000" into a true number 12000
gun.violence$GDP = as.integer(gsub(",", "", gun.violence$GDP))
  
# Turn "1.03 (2016)" into a true number 1.03
gun.violence$Homicides = as.numeric(gsub("\\s\\([0-9]{4}\\)", "", gun.violence$Homicides))
gun.violence$Suicides = as.numeric(gsub("\\s\\([0-9]{4}\\)", "", gun.violence$Suicides))


# Turn into a true number
gun.violence$Cultural_Diversity_Index = as.numeric(gsub("unavailable", "", gun.violence$Cultural_Diversity_Index))
gun.violence$Guns_Per_Capita = as.numeric(gsub("unavailable", "", gun.violence$Guns_Per_Capita))

# Create "developed_nation" column
gun.violence$developed_nation = gun.violence$GDP >= 20000

# fill na values
gun.violence$Guns_Per_Capita2[is.na(gun.violence$Guns_Per_Capita)] = median(gun.violence$Guns_Per_Capita[!is.na(gun.violence$Guns_Per_Capita)])
gun.violence$Homicides2[is.na(gun.violence$Homicides)] = median(gun.violence$Homicides[!is.na(gun.violence$Homicides)])
gun.violence$Suicides2[is.na(gun.violence$Suicides)] = median(gun.violence$Suicides[!is.na(gun.violence$Suicides)])
gun.violence$Cultural_Diversity_Index2[is.na(gun.violence$Cultural_Diversity_Index)] = median(gun.violence$Cultural_Diversity_Index[!is.na(gun.violence$Cultural_Diversity_Index)])
#gun.violence$GDP2[is.na(gun.violence$GDP)] = mean(gun.violence$GDP[!is.na(gun.violence$GDP)])


write.csv(gun.violence, '../data/GunViolenceClean.csv', row.names = FALSE)
