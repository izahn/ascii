# apply that preserves all dim of x...
safe.apply <- function(X, MARGIN, FUN, ...) {
  dimx <- dim(x)
  results <- apply(X, MARGIN, FUN, ...)
  if (!is.null(dimx))
    dim(results) <- dimx
  results
}

expand <- function(x, nrow, ncol, what = NULL, drop = TRUE) {
  if (is.vector(x))
    x <- t(x)

  if (nrow == 0 | ncol == 0) {
    xx <- matrix(nrow = nrow, ncol = ncol)
  } else if (nrow(x) == 0 | ncol(x) == 0) {
    if (!is.null(what)) {
      xx <- matrix(what, nrow, ncol)
  } else {
    xx <- matrix(nrow = nrow, ncol = ncol)
  }
  } else if (nrow(x) > nrow & ncol(x) > ncol) {
    xx <- x[1:nrow, 1:ncol]
  } else if (!is.null(what)) {
    minnrow <- min(c(nrow(x), nrow))
    minncol <- min(c(ncol(x), ncol))
    xx <- matrix(nrow = nrow, ncol = ncol)
    xx[1:minnrow, 1:minncol] <- x[1:minnrow, 1:minncol]
    xx[is.na(xx)] <- what
  } else {
    xx <- apply(t(apply(x, 1, rep, length = ncol)), 2, rep, length = nrow)
  }
  if (!drop) {
    dim(xx) <- c(nrow, ncol)
  }
  xx
}

# paste for matrix
paste.matrix <- function(..., sep = " ", transpose.vector = FALSE, collapse = NULL, byrow = FALSE) {
  args <- list(...)
  args <- args[!sapply(args, is.null)]
  
  args <- lapply(args, function(x) {
    if (!is.matrix(x) & transpose.vector)
      t(as.matrix(x))
    else
      as.matrix(x)
  })

  ncol.max <- max(sapply(args, function(x) ncol(x)))
  nrow.max <- max(sapply(args, function(x) nrow(x)))
  
  mats <- lapply(args, function(x) {
    x <- expand(x, nrow.max, ncol.max)
    x
  })
  
  results <- matrix(do.call("paste", c(mats, sep = sep)), nrow.max, ncol.max)
  if (!is.null(collapse)) {
    margin <- 1
    if (byrow)
      margin <- 2
    results <- apply(results, margin, paste, collapse = collapse)
  }
  results
}