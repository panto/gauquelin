require(lubridate)
require(plyr)

Sport    <- read.delim("data/Gauquelin-SportsChampions.tsv")
Military <- read.delim("data/Gauquelin-MilitaryMan.tsv")
Science  <- read.delim("data/Gauquelin-Scientists-Doctors.tsv")
Paint  <- read.delim("data/Gauquelin-Painters-Musicans.tsv")

plotWeekDays <- function(data, title) {
  data$data <- ymd_hms(sprintf("%d-%d-%d %d:%d:%d", data$YEA, data$MON, data$DAY, data$H,data$MN,data$SEC))
  data$wday <- wday(data$data, label=T)
  counts <- table(data$wday)
  chisq = chisq.test(counts)
  barplot(counts)
  abline(h=mean(counts), col=2, lty=2)
  title(sprintf("%s n=%d\np-value=%.4f", title, nrow(data), chisq$p.value))
}

par(mfrow=c(2,2)) 
plotWeekDays(Sport, "Sports Champions")
plotWeekDays(Military, "Military Man")
plotWeekDays(Science, "Scientists & Doctors")
plotWeekDays(Paint, "Painters & Musicans")