\name{EMbssn}
\alias{EMbssn}
\title{
EM Algorithm Birnbaum-Saunders model based on Skew-Normal distribution
}
\description{
Performs the EM algorithm for Birnbaum-Saunders model based on Skew-Normal distribution.
}
\usage{
EMbssn(ti,alpha,beta,delta,loglik=F,accuracy=1e-8,
show.envelope="FALSE",iter.max=500)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ti}{
the response vector of dimension \eqn{n} where \eqn{n} is the total of observations.
}
  \item{alpha,beta,delta}{
  an numeric  of initial estimates.
}
\item{loglik}{
showvalue of the log-likelihood (V) or not (F).
}
  \item{accuracy}{
the convergence maximum error.
}

\item{show.envelope}{
TRUE or FALSE. Indicates if envelope graph should be built for the fitted model. Default is FALSE.}

\item{iter.max}{
The maximum number of iterations of the EM algorithm}
}



%\details{
%}
\value{
The function returns a list with 11 elements detailed as

\item{iter}{number of iterations.}
\item{alpha}{estimated shape parameter.}
\item{beta}{estimated scale parameter.}
\item{lambda}{estimate skewness parameter.}
\item{SE}{Standard Error estimates.}
\item{table}{Table containing the inference for the estimated parameters.}
\item{loglik}{Log-likelihood value.}
\item{AIC}{Akaike information criterion.}
\item{BIC}{Bayesian information criterion.}
\item{HQC}{Hannan-Quinn information criterion.}
\item{time}{processing time.}
}
\references{
Vilca, Filidor; Santana, L. R.; Leiva, Victor; Balakrishnan, N. (2011). Estimation of extreme percentiles in Birnbaum Saunders distributions. Computational Statistics & Data Analysis (Print), 55, 1665-1678.

Santana, Lucia; Vilca, Filidor; Leiva, Victor (2011). Influence analysis in skew-Birnbaum Saunders regression models and applications. Journal of Applied Statistics, 38, 1633-1649.
}
\author{Rocio Maehara \email{rmaeharaa@gmail.com} and Luis Benites \email{lbenitesanchez@gmail.com}
}
%\note{
%}

\seealso{
\code{\link{bssn}}, \code{\link{EMbssn}}, \code{\link{momentsbssn}}, \code{\link{ozone}}, \code{\link{reliabilitybssn}}
}
\examples{
\dontrun{
#Using the ozone data

data(ozone)
attach(ozone)

#################################
#The model
 ti        <- dailyozonelevel

#Initial values for the parameters
 initial   <- mmmeth(ti)
 alpha0    <- initial$alpha0ini
 beta0     <- initial$beta0init
 lambda0   <- 0
 delta0    <- lambda0/sqrt(1+lambda0^2)

#Estimated parameters of the model (by default)
 est_param <- EMbssn(ti,alpha0,beta0,delta0,loglik=T,
 accuracy = 1e-8,show.envelope = "TRUE", iter.max=500)

#ML estimates
 alpha     <- est_param$res$alpha
 beta      <- est_param$res$beta
 lambda    <- est_param$res$lambda


#########################################
#A simple output example

---------------------------------------------------------
Birnbaum-Saunders model based on Skew-Normal distribution
---------------------------------------------------------

Observations = 116
-----------
Estimates
-----------

       Estimate Std. Error z value Pr(>|z|)
alpha   1.26014    0.23673 5.32311  0.00000
beta   14.65730    4.01984 3.64624  0.00027
lambda  1.06277    0.54305 1.95706  0.05034
------------------------
Model selection criteria
------------------------

        Loglik   AIC   BIC   HQC
Value -542.768 4.705 4.741 4.719
-------
Details
-------

Iterations = 415
Processing time = 0.4283214 secs
Convergence = TRUE
}
}

\keyword{EM}
\keyword{bssn}
