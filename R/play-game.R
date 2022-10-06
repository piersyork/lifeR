#' Create a matrix for playing game of life
#'
#' @param length The length of the rows and columns of the entire matrix
#' @param pattern_length The length of the rows and columns of the pattern that will populate the matrix
#'
#' @return a matrix made up of only 1s and 0s
#' @export
#'
#' @examples
#'
#' game_matrix <- life_matrix(length = 60, pattern_length = 15)
#'
life_matrix <- function(length = 50, pattern_length = 4) {
  size <- length^2
  current_m <- matrix(rep(0, size), length, length)

  pattern_m <- matrix(sample(c(1, 0), pattern_length^2, replace = TRUE), pattern_length, pattern_length)

  corner <- length/2 - pattern_length/2

  current_m[(corner):((corner)+(pattern_length-1)), (corner):((corner)+(pattern_length-1))] <- pattern_m

  return(current_m)
}

#' Play the game of life
#'
#' @param matrix starting matrix
#' @param n_iters number of iterations
#' @param speed_limit How long to wait between each iteration
#'
#' @return plots the game of life
#' @export
#'
#' @examples
#'
#' game_matrix <- life_matrix(length = 40, pattern_length = 15)
#'
#' game_of_life(game_matrix, n_iters = 50, speed_limit = 0.1)
#'
game_of_life <- function(matrix, n_iters, speed_limit = 0.2) {
  for (i in 1:n_iters) {
    plot_m(matrix)
    matrix <- m_iter(matrix)
    if (sum(matrix) == 0) break
    Sys.sleep(speed_limit)
  }
}






