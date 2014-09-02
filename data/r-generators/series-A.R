library(plyr)

# Get raw data
vol1  <- read.delim("data/series-A-raw/Gauquelin-vol1-Sportsmans.tsv")
vol2  <- read.delim("data/series-A-raw/Gauquelin-vol2-Scientists-Doctors.tsv")
vol3  <- read.delim("data/series-A-raw/Gauquelin-vol3-Military.tsv")
vol4  <- read.delim("data/series-A-raw/Gauquelin-vol4-Painters-Musicans.tsv")
vol5  <- read.delim("data/series-A-raw/Gauquelin-vol5-Actors-Politicans.tsv")
vol6  <- read.delim("data/series-A-raw/Gauquelin-vol6-Writers-Jurnalists.tsv")

# The factor levels is changing
vol1$PRO <- revalue(vol1$PRO, c("C"="Sportsmans"))
vol2$PRO <- revalue(vol2$PRO, c("S"="Scientists")) 
vol3$PRO <- revalue(vol3$PRO, c("M"="Military"))
vol4$PRO <- revalue(vol4$PRO, c("P"="Painters", "M"="Musicans"))
vol5$PRO <- revalue(vol5$PRO, c("A"="Actors", "PT"="Politicians"))
vol6$PRO <- revalue(vol6$PRO, c("J"="Jurnalists", "W"="Writers")) 

seriesA = rbind(vol1, vol2, vol3, vol4, vol5, vol6)
write.table(seriesA, file='data/series-A.tsv', quote=FALSE, sep='\t')

# Clearing
# rm(vol1, vol2, vol3, vol4, vol5, vol6)

# Control plot 
# pie(table(professions$PRO))
# title(sprintf("M. Gauqueline Professions (series A, n=%d)", nrow(professions)))
# table(professions$PRO)