\name{kueh_palette}
\alias{kueh_palette}
\alias{kueh_palettes}
\title{A kueh color palette generator}
\description{
  Generate color palettes inspired by Hokkien kueh
}
\usage{
  kueh_palette(name, n, type = c("discrete", "continuous", "paired"))
}
\arguments{
  \item{name}{Name of color palette desired; each is named after a kueh. Use \code{\link{kueh_palettes}()} to see what's available.}
  \item{n}{Number of colors desired; by default, all colors are included, otherwise, the first \code{n} are.}
  \item{type}{\code{"discrete"}, \code{"continuous"}, or \code{"paired"}; see Details.}
}
\details{
For \code{type='discrete'}, the first \code{n} colors from palette \code{name} are returned.

For \code{type='continuous'}, a \code{\link[grDevices]{colorRampPalette}} is constructed for the palette and evaluated at \code{n}.

For \code{type='paired'}, the colors of the palette are darkened and lightened, and then returned. How much darker and lighter is governed by the option \code{'kueh.paired.delta'}, with default 32 (on the \code{\link[grDevices]{rgb}} scale with values 0-256). The darkening/lightening is truncated at the ends of the scale (i.e., 0 and 255).
}
\examples{
  kueh_palette('lapis_sagu')
  kueh_palette('salat', 20L, 'continuous')
}
\keyword{color}
\keyword{palettes}
