\name{fitByDDS}
\alias{fitByDDS}
\title{
  Fit a hydromad model using DDS (Dynamically Dimensioned Search) algorithm.
}
\description{
    Fit a hydromad model using DDS (Dynamically Dimensioned Search) algorithm.
}
\usage{
fitByDDS(MODEL, objective = hydromad.getOption("objective"), control = hydromad.getOption("dds.control"), save = NULL)
}
\arguments{
  \item{MODEL}{
    a model specification created by \code{\link{hydromad}}. It should
    not be fully specified, i.e one or more parameters should be defined
    by \emph{ranges} of values rather than exact values.
}
\item{objective}{
      objective function to maximise, given as a \code{function(Q, X, ...)}.
    See \code{\link{objFunVal}}.
}
  \item{control}{
    settings for the DDS algorithm. These are the arguments to \code{\link{optim_dds}}.
}
  \item{save}{
    Optional \code{function(pars,objective value,model)} that will be
    called for every model evaluation, for example to save every model run.
}
}
\details{
  This function depends on the \code{ppso} package, available from
\link{http://www.rforge.net/ppso/}.
For alternative optimisation algorithms, consider \code{\link{fitBySCE}}.
}
\value{
    the best model from those sampled, according to the given
    \code{objective} function. Also, these extra elements are inserted:
  \item{fit.result}{
    the result from \code{\link{SCEoptim}}.
  }
  \item{objective}{
    the \code{objective} function used.
  }
  \item{funevals}{
    total number of evaluations of the model simulation function.
  }
  \item{timing}{
    timing vector as returned by \code{system.time}.
  }
}
\references{
Tolson, B. A., and C. A. Shoemaker (2007) Dynamically dimensioned search algorithm for computationally efficient watershed model calibration, Water Resour. Res., 43, W01413, doi:10.1029/2005WR004723. http://www.agu.org/journals/wr/wr0701/2005WR004723/
}
\author{
  Joseph Guillaume \email{josephguillaume@gmail.com}
}
\seealso{
  \code{\link{optim_dds}},\code{\link{fitBySCE}}
}
\examples{
data(Cotter)
x <- Cotter[1:1000]

## IHACRES CWI model with power law unit hydrograph
modx <- hydromad(x, sma = "cwi", routing = "powuh")
modx

## run with cut-down settings (for a speedy example only!)
foo <- fitByDDS(modx, control = list(
   max_number_function_calls=100,
   logfile=NULL,
           projectfile=NULL,
           load_projectfile="no"
))

summary(foo)

## return value from DDS:
str(foo$fit.result)
}
\keyword{ optimization }
