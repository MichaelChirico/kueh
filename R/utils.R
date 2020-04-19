pair_colors = function(cols) {
  rgb = grDevices::col2rgb(cols)
  delta = getOption('kueh.paired.delta', 32L)
  out = matrix(nrow = 3L, ncol = 2L*ncol(rgb))
  out[ , seq(1L, ncol(out), by = 2L)] = rgb - delta
  out[ , seq(2L, ncol(out), by = 2L)] = rgb + delta
  out[] = pmin(pmax(out, 0), 255L)
  # convert back to hex
  paste0('#', apply(out, 2L, function(x) paste(sprintf('%02X', x), collapse = '')))
}
