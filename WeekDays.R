require(lubridate)
source('data/professions.R')

plotWeekDays <- function(data, title) {
  data$data <- ymd_hms(sprintf("%d-%d-%d %d:%d:%d", data$YEA, data$MON, data$DAY, data$H,data$MN,data$SEC))
  data$wday <- wday(data$data, label=T)
  counts <- table(data$wday)
  chisq = chisq.test(counts)
  barplot(counts)
  abline(h=mean(counts), col=2, lty=2)
  title(sprintf("%s\nn=%d p-value=%.3f", title, nrow(data), chisq$p.value))
}

par(mfrow=c(3,3)) 
plotWeekDays(subset(professions, PRO=="Sportsmans"), "Sportsmans")
plotWeekDays(subset(professions, PRO=="Scientists"), "Scientists")
plotWeekDays(subset(professions, PRO=="Military"), "Military")
plotWeekDays(subset(professions, PRO=="Painters"), "Painters")
plotWeekDays(subset(professions, PRO=="Musicans"), "Musicans")
plotWeekDays(subset(professions, PRO=="Actors"), "Actors")
plotWeekDays(subset(professions, PRO=="Politicians"), "Politicians")
plotWeekDays(subset(professions, PRO=="Writers"), "Writers")
plotWeekDays(subset(professions, PRO=="Jurnalists"), "Jurnalists")