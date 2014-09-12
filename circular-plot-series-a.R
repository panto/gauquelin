library(circular)
library(lubridate)

plotCircular <- function(data,title) {
  plot(data, stack=T, bins=365, cex=0.9,col="blue",shrink=1.2)
  title(sprintf("%s n=2087\nrozkład urodzin w roku (0 = 1 sty)", title), line=0)
  lines(density.circular(data,bw=120,adjust = 10), lwd=2, col=2)
  rose.diag(data, bins=12, cex=0.9, prop=2.5, col="grey", add=T)
}
pro  <- read.delim("data/series-A+TIME.tsv")

pro$yday <- yday(pro$TIME)
pro$y2d <- (360 * pro$yday) / 365
pro$circular <- circular(pro$y2d, units="degrees", zero=circular(pi/1), rotation="clock")

spo = subset(pro, PRO=="Sportsmen")
sci = subset(pro, PRO=="Scientists")

par(mfrow=c(1,2))
plotCircular(spo$circular,"Sportowcy")
plotCircular(sci$circular,"Naukowcy")