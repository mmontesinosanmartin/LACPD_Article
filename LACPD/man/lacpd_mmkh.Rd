% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lacpd_mmkh.R
\name{lacpd_mmkh}
\alias{lacpd_mmkh}
\title{Locally change-point detection using the mmkh approach}
\usage{
lacpd_mmkh(
  x,
  m = 1,
  k = 2,
  blow = 0.1,
  bup = (1 - blow),
  leave = FALSE,
  adjust = FALSE,
  history = FALSE,
  ...
)
}
\arguments{
\item{x}{a numeric vector}

\item{m}{number of times to sub-sample}

\item{k}{single number or numeric vector proportional to the number of points on each side of the target point. See details}

\item{blow}{fraction of observations (0-1) at the beginning of the time-series not considered for change detection}

\item{bup}{similar to \code{blow}, but for the end of the time series. Default is 1-\code{blow}}

\item{leave}{if \code{TRUE}, the function uses the leave-one-out technique when looking for changes}

\item{adjust}{if \code{TRUE}, p-value will be adjusted by methods in \link[stats]{p.adjust}}

\item{history}{if \code{TRUE}, it maintains the stepwise results when \code{k} is a vector}

\item{...}{arguments passed to \link[stats]{p.adjust}}
}
\value{
cp: the index of the most probable change point in the time series

z: the z statistics of LACPD

magnitude: the magnitude of change

p.value: the corresponding p.value

s: the time-periods that the function has looked for potential changes


Attributes:

attr(,"zs"): retrieves the obtained z statistics at the time-periods the function has looked for potential changes

attr(,"ps"): retrieves the obtained p-values at the time-periods the function has looked for potential changes

attr(,"mags"): retrieves the magnitude of change at the time-periods the function has looked for potential changes


if \code{history=TRUE} and \code{k} is a numeric vector, then the following attributes can also be retrieved.

attr(,"history"): a dataframe containing the results (cp, magnitude, Z, and p.value) based on different adaptive sliding windows which are permutations of the given \code{k}

attr(,"allzs"): a list which retrieves the obtained z statistics at the time-periods the function has looked for potential changes based on different adaptive sliding windows which are permutations of the given \code{k}

attr(,"allmags"): a list which retrieves the magnitude of change at the time-periods the function has looked for potential changes based on different adaptive sliding windows which are permutations of the given \code{k}

attr(,"allps"): a list which retrieves the obtained p-values at the time-periods the function has looked for potential changes based on different adaptive sliding windows which are permutations of the given \code{k}
}
\description{
Locally change-point detection after accommodating the mmkh approach in LACPD procedure
}
\details{
This technique accommodates the \link[modifiedmk]{mmkh} trend detection method in the LACPD procedure of Moradi et al. (2020) to look for potential change-points in the numerical vector x.

In the tails of \code{x}, since there are not enough data points before/after the target points, the method uses sub-sampling, wherein it moderates the effect of sub-sampling by iteration.

Assume the length of \code{x} is n. The argument \code{k} is used to set the number of data in the sides of the target point when looking for change-points. n/\code{k}  is the number of points on each side we consider. For instance, if n=300 and k=10, this means we consider 30 observations before and 30 after when locally detecting changes.

If \code{leave=TRUE}, the function removes the target point when checking for possible changes at the target point.

If \code{adjust=TRUE}, methods susch as "holm", "hochberg", "hommel", "bonferroni", "BH", "BY", "fdr", "none" can be passed through function, e.g. method="BY".

If \code{k} is a vector of numbers, then the function returns a result based on adaptive sliding windows which is an average result obtained from different windows.
}
\examples{
x <- rnorm(50)
Z <- lacpd_mmkh(x,m=10,k=3)
plot(Z$s,attr(Z,"zs"),type="l",ylab = "Z",xlab = "time")
plot(Z$s,attr(Z,"mags"),type="l",ylab = "Z",xlab = "time")
}
\references{
Moradi, M., Montesino-SanMartin, M., Ugarte, M. D., and Militino, A. F. (2020). Locally adaptive change-point detection with applications to remote sensing and land use changes.
}
\seealso{
\link[modifiedmk]{mmkh}, \link[stats]{p.adjust}
}
\author{
Mehdi Moradi \email{m2.moradi@yahoo.com}, Manuel Montesino-SanMartin \email{manuel.montesino@unavarra.es}
}
