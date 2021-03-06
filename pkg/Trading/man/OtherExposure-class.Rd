% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Other.R
\docType{class}
\name{OtherExposure-class}

\alias{OtherExposure}
\title{OtherExposure Class}
\arguments{
\item{Notional}{The notional amount of the trade}

\item{MTM}{The mark-to-market valuation of the trade}

\item{Currency}{The currency set that the trade belongs to}

\item{Si}{The number of years that the trade will take to start (zero if already started)}

\item{Ei}{The number of years that the trade will expire}

\item{BuySell}{Takes the values of either 'Buy' or 'Sell'}

\item{SubClass}{Defines the hedging set the relevant trade will belong to}
}
\value{
An object of type OtherExposure
}
\description{
Creates a OtherExposure Object with the relevant info needed to calculate the Exposure-at-Default (EAD)
}

\examples{


tr1 = OtherExposure(Notional=10000,MtM=-50,Si=0,Ei=10,
BuySell='Buy',SubClass='Other_1')
}
\references{
Regulation (EU) 2019/876 of the European Parliament and of the Council of 20 May 2019
http://data.europa.eu/eli/reg/2019/876/oj
}
\author{
Tasos Grivas <tasos@openriskcalculator.com>
}
