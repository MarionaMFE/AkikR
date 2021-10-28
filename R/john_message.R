john_message <- function(color1 = "blue", color2 = "yellow", color3 = "red"){

  require(ggplot2)
  require(tibble)
  print("Change the color paramaters if you want me to run and pick a new flower.")
  p <- ggplot() +
    coord_equal(1, c(-6, 6), c(-7, 4)) +
    geom_curve(aes(x = -1, y = -7, xend = 0, yend = 0),
               ncp = 1000, curvature = -0.3, size = 1,
               color = "olivedrab3")
  geom_leaf <- function(x, xend, f, xoffset = 0, yoffset = 0,
                        xflip = 1, yflip = 1, ...) {
    .x <- seq(x, xend, length.out = 100)
    .y <- f(.x)
    df <- tibble(x = c(.x, .y), y = c(.y, .x))
    df$x <- xflip * df$x + xoffset
    df$y <- yflip * df$y + yoffset
    geom_polygon(aes(x = x, y = y), data = df, ...)
  }
  f <- function(x) x^2 / 2
  p <- p +
    geom_leaf(0, 2, f, -1.6, -4.5, 1,
              fill = "olivedrab3", color = "palegreen") +
    geom_leaf(0, 2, f, -1.6, -5,  -1,
              fill = "olivedrab3", color = "palegreen")
  geom_rose <- function(n, mean = c(0, 0), ...) {
    .x <- mvtnorm::rmvnorm(n, mean)
    df <- tibble(x = .x[, 1], y = .x[, 2])
    list(
      stat_density_2d(
        aes(x = x, y = y, fill = stat(level)), data = df,
        geom = "polygon", show.legend = FALSE, color = "grey80"),
      scale_fill_gradient2(...)
    )
  }
  p <- p +
    geom_rose(1000, mean = c(0, 0),
              low = color1, mid = color2, high = color3,
              midpoint = 0.075) #+
  #heme_void()
  p +
    annotate("text",
             x = c(-1.2,-1.75, 0, -1.5),
             y = c(2.5,-2.5,-5,-6.5),
             label = c("Thank you for all your hard work over the past 2 years",
                       "You’ve really helped the team/us  move \nforward in the data space over that period.",
                       "Congratulations on your secondment. \n Wishing you all the best.",
                       "Don’t be a stranger and \n don't forget about \"super shorts Fridays\""),
             size = 2.5) +
    theme_void()
}
