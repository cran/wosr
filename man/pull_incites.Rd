% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pull-incites.R
\name{pull_incites}
\alias{pull_incites}
\title{Pull data from the InCites API}
\usage{
pull_incites(uts, key = Sys.getenv("INCITES_KEY"), as_raw = FALSE, ...)
}
\arguments{
\item{uts}{A vector of UTs whose InCites data you would like to download.
Each UT is a 15-digit identifier for a given publication. You
can specify the UT using only these 15 digits or you can append the 15 digits
with "WOS:" (e.g., "000346263300011" or "WOS:000346263300011").}

\item{key}{The developer key that the server will use for authentication.}

\item{as_raw}{Do you want the data frame that is returned by the API to be
returned to you in its raw form? This option can be useful if the API has
changed the format of the data that it is serving, in which case specifying
\code{as_raw = TRUE} may avoid an error that would otherwise occur during
\code{pull_incites}'s data processing step.}

\item{...}{Arguments passed along to \code{\link[httr]{GET}}.}
}
\value{
A data frame where each row corresponds to a different publication.
The definitions for the columns in this data frame can be found online at
the API's documentation \href{http://about.incites.thomsonreuters.com/api/#/}{page}
(see the \code{DocumentLevelMetricsByUT} method details for definitions).
Note that the column names are all converted to lowercase by
\code{pull_incites} and the 0/1 flag variables are converted to booleans.
Also note that not all publications indexed in WoS are also indexed in
InCites, so you may not get data back for some UTs.
}
\description{
\strong{Important note:} The throttling limits on the InCites API are not
documented anywhere and are difficult to determine from experience. As such,
whenever \code{pull_incites} receives a throttling error from the server, it
uses exponential backoff (with a maximum wait time of 45 minutes) to determine
how long to wait before retrying.
}
\examples{
\dontrun{

uts <- c(
  "WOS:000346263300011", "WOS:000362312600021", "WOS:000279885800004",
  "WOS:000294667500003", "WOS:000294946900020", "WOS:000412659200006"
)
pull_incites(uts, key = "some_key")

pull_incites(c("000346263300011", "000362312600021"), key = "some_key")
}
}
