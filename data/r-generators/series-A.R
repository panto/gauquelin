library(plyr)

# Get raw data
vol1  <- read.delim("data/series-A-raw/Gauquelin-vol1-Sportsmen.tsv")
vol2  <- read.delim("data/series-A-raw/Gauquelin-vol2-Scientists-Doctors.tsv")
vol3  <- read.delim("data/series-A-raw/Gauquelin-vol3-Military.tsv")
vol4  <- read.delim("data/series-A-raw/Gauquelin-vol4-Painters-Musicians.tsv")
vol5  <- read.delim("data/series-A-raw/Gauquelin-vol5-Actors-Politicans.tsv")
vol6  <- read.delim("data/series-A-raw/Gauquelin-vol6-Writers-Journalists.tsv")

# Chenging the name of the factor level
vol1$PRO <- revalue(vol1$PRO, c("C"="Sportsmen"))
vol2$PRO <- revalue(vol2$PRO, c("S"="Scientists")) 
vol3$PRO <- revalue(vol3$PRO, c("M"="Military"))
vol4$PRO <- revalue(vol4$PRO, c("P"="Painters", "M"="Musicians"))
vol5$PRO <- revalue(vol5$PRO, c("A"="Actors", "PT"="Politicians"))
vol6$PRO <- revalue(vol6$PRO, c("J"="Journalists", "W"="Writers")) 

# Bind data.frames
professions = rbind(vol1, vol2, vol3, vol4, vol5, vol6)

# The level name is chenging
professions$COU <- revalue(professions$COU, c("F"="France", "I"="Italy", "G"="Germany", "B"="Belgium", "N"="Netherlands", "S"="Switzerland"))

# WRITE !!!
write.table(professions, file='data/series-A.tsv', quote=FALSE, sep='\t')

# Clearing
rm(vol1, vol2, vol3, vol4, vol5, vol6)

# Control plot 
par(mfrow=c(1,2))

pie(table(professions$PRO))
title(sprintf("Professions - series A (n=%d)", nrow(professions)))
table(professions$PRO)

cou.freq <- table(professions$COU)
label <- sprintf("%s n=%d", names(cou.freq), cou.freq)
pie(cou.freq, labels=label, col=rainbow(15))
title(sprintf("Countries - Series A. (real n=%d)",nrow(professions)))