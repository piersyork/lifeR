
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lifeR

<!-- badges: start -->
<!-- badges: end -->

lifeR let’s you play Conway’s Game of Life in R.

It’s currently implemented using a finite box, whereas the true Game of
Life has an infinite space. This leads to incorrect behaviour when cells
reach the border of the box.

## Installation

You can install the development version of lifeR like so:

``` r
devtools::install_github("piersyork/lifeR")
```

## Example

The following code shows how you can set up and play the Game of Life in
the RStudio plot window. For the best results resize the plotting window
to a square.

``` r
library(lifeR)

life_matrix(60, pattern_length = 20) |> 
  game_of_life(n_iters = 40, speed_limit = 0.1)
```

To output a gif or mp4, pipe your game of life into the `animation`
package like so:

``` r
life_matrix(60, pattern_length = 20) |> 
  game_of_life(n_iters = 100, speed_limit = 0) |>  # set speed limit to 0 for fastest results
  animation::saveGIF("game-of-life.gif", interval = 0.2)
```

![game-of-life](game-of-life.gif)
