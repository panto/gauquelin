library(circular)

plotCircular <- function(data) {
  plot(data, stack=TRUE, bins=360, cex=1.5,col = "blue")
  arrows.circular(data,col="gray")
  arrows.circular(mean(data), y=rho.circular(data), lwd=5, col="red")
  title(sprintf("mean=%.2f° rho=%.2f", mean.circular(data),rho.circular(data)), line=0)
}

par(mfrow=c(1,2))
plotCircular(2*cfB11)
plotCircular(4*cfB11)