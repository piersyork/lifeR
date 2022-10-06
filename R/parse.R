#' Experimental function to parse .cells file from Life Wiki
#'
#' @param con Connection to the file
#'
#' @return a matrix
#' @export
#'
#' @examples
#'
#' gosper <- parse_cells("https://conwaylife.com/patterns/gosperglidergun.cells")
#'
parse_cells <- function(con) {
  raw <- readLines(con)
  rm_text <- grep("^\\!", raw, value = TRUE, invert = TRUE)


  max_len <- max(sapply(rm_text, nchar))
  rows <- vector(mode = "list", length = length(rm_text))
  for (i in 1:length(rm_text)) {
    rows[[i]] <- vector(length = max_len)
    for (j in 1:nchar(rm_text[i])) {
      rows[[i]][j] <- if (substr(rm_text[i], j, j) == ".") 0 else 1
    }
  }
  pattern_m <- do.call(cbind, rows)

  return(pattern_m)
}
