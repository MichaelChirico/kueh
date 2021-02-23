kueh_palette <- function(name, n, type = c("discrete", "continuous", "paired")) {
  type = match.arg(type)

  palette = .kueh[[name]]
  if (is.null(palette)) {
    stop(
      gettextf("No palette named '%s' available. Check kueh_palettes()",
               name, domain = "R-kueh"),
      domain = NULL
    )
  }

  if (missing(n)) {
    n = length(palette)
  } else if ((type == "discrete" && n > length(palette)) || (type == "paired" && n > 2*length(palette))) {
    stop(
      gettextf("Requested %d colors, but only %d are available.",
               n, length(palette), domain = "R-kueh"),
      domain = NULL
    )
  }

  if (type == 'continuous') {
    out = grDevices::colorRampPalette(palette)(n)
  } else if (type == 'discrete') {
    out = utils::head(palette, n)
  } else {
    out = utils::head(pair_colors(utils::head(palette, ceiling(n/2))), n)
  }

  structure(out, class = "kueh", name = name)
}

.kueh = list(
  lapis_sagu = c(
    '#ee1c47', '#b4c98d', '#d3893d', '#f4c79e', '#f1114c', '#d1b6b2'
  ),
  manis = c(
    '#4d9a18', '#704f1d', '#73c52c'
  ),
  salat = c(
    '#c5c341', '#184c7b', '#d4d2dc'
  ),
  dadar = c(
    '#c4d979', '#b6581b', '#8b9f3c'
  ),
  ondeh_ondeh = c(
    '#679849', '#e2e5db', '#793401', '#d6ad32'
  ),
  ang_ku = c(
    '#ed0000', '#e5cb42', '#be90b7', '#eda553', '#615248', '#72a70f'
  ),
  lapis = c(
    '#d59c70', '#e9b232', '#c37740'
  )
)

kueh_palettes = function() return(.kueh)

print.kueh <- function(x, ...) {
  n <- length(x)
  old <- graphics::par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(graphics::par(old))

  graphics::image(
    1:n, 1, as.matrix(1:n), col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n"
  )

  graphics::rect(0, 0.9, n + 1, 1.1, col = "#FFFFFFCC", border = NA)
  graphics::text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
