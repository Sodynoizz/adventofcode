fn <- if (length(commandArgs(TRUE)) >= 1) commandArgs(TRUE)[1] else "input/6.in"
p1 <- 0
p2 <- 0


data <- readLines(fn)
grid <- strsplit(data, NULL)
rows <- length(grid)
cols <- nchar(data[1])
start_row <- 0
start_col <- 0

for (row in seq_len(rows)) {
  for (col in seq_len(cols)) {
    if (grid[[row]][col] == "^") {
      start_row <- row
      start_col <- col
    }
  }
}

for (obst_row in seq_len(rows)) { #nolint
  for (obst_col in seq_len(cols)) {
    r <- start_row
    c <- start_col
    direction <- 0
    seen <- character()
    seen_rc <- character()
    repeat {
      state <- paste(r, c, direction, sep = ",")
      if (state %in% seen) {
        p2 <- p2 + 1
        break
      }
      seen <- c(seen, state)
      seen_rc <- c(seen_rc, paste(r, c, sep = ","))
      dr <- c(-1, 0, 1, 0)
      dc <- c(0, 1, 0, -1)
      rr <- r + dr[direction + 1]
      cc <- c + dc[direction + 1]
      if (!(1 <= rr && rr <= rows && 1 <= cc && cc <= cols)) {
        if (grid[[obst_row]][obst_col] == "#") {
          p1 <- length(unique(seen_rc))
        }
        break
      }
      if (grid[[rr]][cc] == "#" || (rr == obst_row && cc == obst_col)) {
        direction <- (direction + 1) %% 4
      } else {
        r <- rr
        c <- cc
      }
    }
  }
}

pr(p1)
pr(p2)