% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spatial_val_accuracy_Simple_Random.R
\name{accuracy.random}
\alias{accuracy.random}
\title{Calculates accuracy of land/forest cover maps based on random sampling}
\usage{
accuracy.random(cm, area, alpha = 0.05)
}
\arguments{
\item{cm}{Input confusion matrix where reference classes are represented in the columns and mapped classes are in the rows. It can be data.frame or matrix with equal number of rows and columns.}

\item{area}{A list containing the area proportions (between o to 1) of each classes within the mapped area.}

\item{alpha}{Value (1-confidence level) used for calculating z score for upper and lower limits of the accuracy estimates.}
}
\value{
Returns a \code{list} object containing:
}
\description{
This function calculates accuracy of land/forest cover and its change mapping. For sample collected using simple random sampling. Accuracy estimates such as overall accuracies, class accuracies are calculated while correcting
area bias in the sample representation that is recommended when the sample sites do not have equal inclusion probability. Area estimation of land/forest cover classes are also corrected for map error (Card 1982 and Olofsson et al 2014, Tsendbazar et al 2016).
Area weighted or error adjusted accuracy and area estimation uses a normal confusion matrix based on sample counting and proportion of area of land/forest cover classes. Accuracy calculations
by Card 1982 is implemented.
}
\details{
ADD extra details about the function and methods here Nandika, if any ......
}
\section{}{

{\code{overall_accuracy} {:} {Matrix of class \code{"numeric"}, containing overall accuracies (sample count and area adjusted), their variences and confidence intervals.}}
 \describe{
   \itemize{
   \item{\code{sample n} {-} {Total number of sample used for the analysis}}
   \item{\code{overall accuracy} {-} {Overall accuracies based on sample-count based and area adjusted confusion matrices}}
   \item{\code{overall accuracy variance} {-} {Variance of the overall accuracies based on sample-count based and area adjusted confusion matrices}}
   \item{\code{o.a.upper limit} {-} {Upper limit of the overall accuracies based on the confidence level of 1-Alpha e.g.95 percent condence level: 1-0.05}}
   \item{\code{o.a.lower limit} {-} {Lower limit of the overall accuracies based on the confidence level of 1-Alpha e.g.95 percent condence level: 1-0.05}}
   }
   {\code{class_area_accuracy} : {Matrix of class \code{"numeric"}, containing class specific user's and producer's accuracies as well as area estimation of each classes adjusted for area bias for the sample selection and map error.}}
   \itemize{
   \item{\code{tp} {-} {True proportion: Error adjusted map proportion for each class.}}
   \item{\code{tpc} {-} {Confidence interval for the error adjusted map proportions. Upper limit tp+tpc; Lower limit tp-tpc}}
   \item{\code{uaw} {-} {User's accucary for each class based after adjusting area bias of the sample selection}}
   \item{\code{uac} {-} {Confidence intervals for the user accucaries. Upper limit uaw+uac; lower limit uaw-uac}}
   \item{\code{paw} {-} {Producer's accucary for each class based after adjusting area bias of the sample selection}}
   \item{\code{pac} {-} {Confidence intervals for the producer accucaries. Upper limit paw+pac; lower limit uaw-uac}}
   }
   {\code{adjusted_conf_matrix} : {A confusion matrix that is corrected for adjusted for area bias for the sample selection.}}
 }
}
\examples{
\dontrun{


#preparing matrix
cm<-c(48, 0, 2, 5, 1, 49, 0, 4, 1, 0, 47, 3, 0, 1, 1, 34)
cm1<-matrix(cm, 4, 4, byrow=T)
rownames(cm1)<-c( "class1", "class2", "class3", "class4")
colnames(cm1)<-c( "class1", "class2", "class3", "class4")
#proportions of the classes
area<-c(0.4, 0.4, 0.14, 0.06)
test.acc<-accuracy.random(cm1, area, alpha=0.05)
}
}
\author{
Nandika Tsendbazar
}
\references{
1. Card, D.H."Using known map category marginal frequencies to improve estimates of thematic map accuracy." Review of. Photogrammetric Engineering and Remote Sensing 48 (3):431-9.

2. Tsendbazar, N. E., S. de Bruin, B. Mora, L. Schouten, and M. Herold."Comparative assessment of thematic accuracy of GLC maps for specific applications using existing reference data." International Journal of Applied Earth Observation and Geoinformation 44:124-35.
 \url{http://dx.doi.org/10.1016/j.jag.2015.08.009}

3. Olofsson, Pontus, Giles M. Foody, Martin Herold, Stephen V. Stehman, Curtis E. Woodcock, and Michael A. Wulder."Good practices for estimating area and assessing accuracy of land change." Remote Sensing of Environment 148:42-57.
 \url{http://dx.doi.org/10.1016/j.rse.2014.02.015}
}

