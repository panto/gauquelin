# 1) The pro$TIME column from 6 original columns is making. 2) Old six columns are removed.  

require(lubridate)
  
pro  <- read.delim("data/series-A.tsv")
# TODO pro$TZ <- revalue(pro$TZ, c("0"="GMT", "-1"="CET"))

pro$TIME <-  ymd_hms(sprintf("%d-%d-%d %d:%d:%d", pro$YEA, pro$MON, pro$DAY, pro$H,pro$MN,pro$SEC))

# Drop columns 
drops <- c('YEA', 'MON', 'DAY', 'H', 'MN', 'SEC')
pro <- pro[,!(names(pro) %in% drops)]

# Change column order in data.frame 
pro <- pro[ c('PRO', 'NUM', 'COU', 'TIME', 'TZ', 'LAT', 'LON', 'COD', 'CITY')]

# WRITE!!!
write.table(pro, file='data/series-A+time.tsv', quote=FALSE, sep='\t')