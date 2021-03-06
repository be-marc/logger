% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OptimInstance.R
\name{OptimInstance}
\alias{OptimInstance}
\title{Optimization Instance with budget and archive}
\description{
Wraps an \link{Objective} function with extra services for convenient evaluation.
\itemize{
\item Automatic storing of results in an \link{Archive} after evaluation.
\item Automatic checking for termination. Evaluations of design points are
performed in batches. Before a batch is evaluated, the \link{Terminator} is
queried for the remaining budget. If the available budget is exhausted, an
exception is raised, and no further evaluations can be performed from this
point on.
}
}
\section{Technical details}{

The \link{Optimizer} writes the final result to the \code{.result} field by using
the \verb{$assign_result()} method. \code{.result} stores a \link[data.table:data.table]{data.table::data.table}
consisting of x values in the \emph{search space}, (transformed) x values in the
\emph{domain space} and y values in the \emph{codomain space} of the \link{Objective}. The
user can access the results with active bindings (see below).

In order to replace the default logging messages with custom logging, the
\verb{.log_*} private methods can be overwritten in an \code{OptimInstance} subclass:
\itemize{
\item \verb{$.log_eval_batch_start()} Called at the beginning of \verb{$eval_batch()}
\item \verb{$.log_eval_batch_finish()} Called at the end of \verb{$eval_batch()}
}
}

\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{objective}}{(\link{Objective}).}

\item{\code{search_space}}{(\link[paradox:ParamSet]{paradox::ParamSet}).}

\item{\code{terminator}}{(\link{Terminator}).}

\item{\code{is_terminated}}{(\code{logical(1)}).}

\item{\code{archive}}{(\link{Archive}).}
}
\if{html}{\out{</div>}}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{result}}{(\link[data.table:data.table]{data.table::data.table})\cr
Get result}

\item{\code{result_x_search_space}}{(\link[data.table:data.table]{data.table::data.table})\cr
x part of the result in the \emph{search space}.}

\item{\code{result_x_domain}}{(\code{list()})\cr
(transformed) x part of the result in the \emph{domain space} of the objective.}

\item{\code{result_y}}{(\code{numeric()})\cr
Optimal outcome.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{OptimInstance$new()}}
\item \href{#method-format}{\code{OptimInstance$format()}}
\item \href{#method-print}{\code{OptimInstance$print()}}
\item \href{#method-eval_batch}{\code{OptimInstance$eval_batch()}}
\item \href{#method-assign_result}{\code{OptimInstance$assign_result()}}
\item \href{#method-clone}{\code{OptimInstance$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Creates a new instance of this \link[R6:R6Class]{R6} class.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{OptimInstance$new(objective, search_space, terminator)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{objective}}{(\link{Objective}).}

\item{\code{search_space}}{(\link[paradox:ParamSet]{paradox::ParamSet}).}

\item{\code{terminator}}{(\link{Terminator}).}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-format"></a>}}
\if{latex}{\out{\hypertarget{method-format}{}}}
\subsection{Method \code{format()}}{
Helper for print outputs.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{OptimInstance$format()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-print"></a>}}
\if{latex}{\out{\hypertarget{method-print}{}}}
\subsection{Method \code{print()}}{
Printer.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{OptimInstance$print(...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{...}}{(ignored).}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-eval_batch"></a>}}
\if{latex}{\out{\hypertarget{method-eval_batch}{}}}
\subsection{Method \code{eval_batch()}}{
Evaluates all input values in \code{xdt} by calling
the \link{Objective}. Applies possible transformations to the input values
and writes the results to the \link{Archive}.

Before each batch-evaluation, the \link{Terminator} is checked, and if it
is positive, an exception of class \code{terminated_error} is raised. This
function should be internally called by the \link{Optimizer}.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{OptimInstance$eval_batch(xdt)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{xdt}}{(\code{data.table})\cr
x values as \code{data.table} with one point per row.
Contains the value in the \emph{search space} of the \link{OptimInstance} object.
Can contain additional columns for extra information.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-assign_result"></a>}}
\if{latex}{\out{\hypertarget{method-assign_result}{}}}
\subsection{Method \code{assign_result()}}{
The \link{Optimizer} object writes the best found point
and estimated performance value here. For internal use.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{OptimInstance$assign_result(xdt, y)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{xdt}}{(\code{data.table})\cr
x values as \code{data.table} with one row.
Contains the value in the \emph{search space} of the \link{OptimInstance} object.
Can contain additional columns for extra information.}

\item{\code{y}}{(\code{numeric(1)})\cr
Optimal outcome.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{OptimInstance$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
