library(ggplot2)
library(hexbin)

dat <- data.frame(x = rnorm(10000), y = rnorm(10000))


plot(dat)

ggplot(dat, aes(x = x, y = y)) +
  geom_hex() + coord_fixed() +
  scale_fill_gradientn(colours = viridis(256, option = "D"))

# using code from RColorBrewer to demo the palette
n = 200
image(
  1:n, 1, as.matrix(1:n),
  col = viridis(n, option = "D"),
  xlab = "viridis n", ylab = "", xaxt = "n", yaxt = "n", bty = "n"
)