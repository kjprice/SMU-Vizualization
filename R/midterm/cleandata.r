gun.violence = read.csv('data/GunViolence.csv')

# Turn "12,000" into a true number 12000
gun.violence$GDP = as.integer(gsub(",", "", gun.violence$GDP))

# Turn "1.03 (2016)" into a true number 1.03
gun.violence$Homicides = as.numeric(gsub("\\s\\([0-9]{4}\\)", "", gun.violence$Homicides))
gun.violence$Suicides = as.numeric(gsub("\\s\\([0-9]{4}\\)", "", gun.violence$Suicides))

# Turn into a true number
gun.violence$Cultural.Diversity.Index = as.numeric(gsub("unavailable", "", gun.violence$Cultural.Diversity.Index))

write.csv(gun.violence, 'data/GunViolenceClean.csv')