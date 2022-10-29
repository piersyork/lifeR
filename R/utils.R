#' Plot a matrix
#'
#' @param matrix a matrix to plot
#'
#' @return Plots the matrix
#' @export
#'
plot_m <- function(matrix) {
  graphics::image(apply(t(matrix),2,rev), axes = FALSE, col = grDevices::grey(seq(1, 0, length = 256)))
}

#' Internal function to calculate the number of neighbours that a matrix cell has
#'
#' @param matrix a matrix
#' @param index the cell index as a vector
#'
#' @return the number of neighbours
#' @noRd
#'
n_neighbours <- function(matrix, index) {
  matrix[index[1], index[2]] <- 0
  sum(matrix[(index[1]-1):(index[1]+1), (index[2]-1):(index[2]+1)])
}

#' Internal function to iterate to the next matrix according to game of life rules
#'
#' @param matrix current matrix
#'
#' @return next matrix iteration
#' @noRd
#'
m_iter <- function(matrix) {
  if (nrow(matrix) != ncol(matrix)) {
    stop("Matrix must be square")
  }
  sqr_size <- nrow(matrix)
  out_m <- matrix(0, sqr_size, sqr_size)

  for (i in 1:sqr_size) {
    if (i == 1 | i == sqr_size) next # ignore border cells

    for (j in 1:sqr_size) {
      if (j == 1 | j == sqr_size) next # ignore border cells
      current <- matrix[i, j]
      n_n <- n_neighbours(matrix, c(i, j))

      if ((current == 1 & (n_n == 2 | n_n == 3)) | (current == 0 & n_n == 3)) {
        out_m[i, j] <- 1
      } else {
        out_m[i, j] <- 0
      }

    }
  }
  return(out_m)
}

