% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/task.r
\name{quickdf}
\alias{quickdf}
\title{Convert a list to a data frame}
\usage{
quickdf(l)
}
\arguments{
\item{l}{list suitable to be a data frame with quick conversion}
}
\value{
a data frame
}
\description{
this idea and code (quickdf) is attributed to Hadley Wickham
http://adv-r.had.co.nz/Profiling.html
it's much faster than using as.data.frame, and in our use case
we seem to be guaranteed well-formed lists
}

