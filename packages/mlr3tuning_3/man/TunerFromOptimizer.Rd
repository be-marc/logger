% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TunerFromOptimizer.R
\name{TunerFromOptimizer}
\alias{TunerFromOptimizer}
\title{TunerFromOptimizer}
\description{
Internally used to transform \link[bbotk:Optimizer]{bbotk::Optimizer} to \link{Tuner}
}
\section{Super class}{
\code{\link[mlr3tuning:Tuner]{mlr3tuning::Tuner}} -> \code{TunerFromOptimizer}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{TunerFromOptimizer$new()}}
\item \href{#method-optimize}{\code{TunerFromOptimizer$optimize()}}
\item \href{#method-clone}{\code{TunerFromOptimizer$clone()}}
}
}
\if{html}{
\out{<details open ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="mlr3tuning" data-topic="Tuner" data-id="format">}\href{../../mlr3tuning/html/Tuner.html#method-format}{\code{mlr3tuning::Tuner$format()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="mlr3tuning" data-topic="Tuner" data-id="print">}\href{../../mlr3tuning/html/Tuner.html#method-print}{\code{mlr3tuning::Tuner$print()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Creates a new instance of this \link[R6:R6Class]{R6} class.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TunerFromOptimizer$new(optimizer)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{optimizer}}{\link[bbotk:Optimizer]{bbotk::Optimizer}\cr
Optimizer that is called.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-optimize"></a>}}
\if{latex}{\out{\hypertarget{method-optimize}{}}}
\subsection{Method \code{optimize()}}{
Performs the tuning on a \link{TuningInstance} until termination.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TunerFromOptimizer$optimize(inst)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{inst}}{\link{TuningInstance}.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Modified \code{self}.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TunerFromOptimizer$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
