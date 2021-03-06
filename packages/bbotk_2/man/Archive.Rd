% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Archive.R
\name{Archive}
\alias{Archive}
\title{Logging object for objective function evaluations}
\description{
Container around a \link[data.table:data.table]{data.table::data.table} which stores all performed
\link{Objective} function calls.
}
\section{Technical details}{


The data is stored in a private \code{.data} field that contains a \link[data.table:data.table]{data.table::data.table} which
logs all performed \link{Objective} function calls. The \link[data.table:data.table]{data.table::data.table} is accessed with
the \verb{$data()} method. New values can be added with the \verb{$add_evals()} method.
This however is usually done through the evaluation of the \link{OptimInstance} by the \link{Optimizer}.
}

\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{search_space}}{(\link[paradox:ParamSet]{paradox::ParamSet})\cr
Search space that is logged into archive.}

\item{\code{codomain}}{(\link[paradox:ParamSet]{paradox::ParamSet})\cr
Codomain of objective function that is logged into archive.}

\item{\code{start_time}}{(\link{POSIXct}).}
}
\if{html}{\out{</div>}}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{n_evals}}{(\code{ìnteger(1)})\cr
Number of evaluations stored in the archive.}

\item{\code{n_batch}}{(\code{ìnteger(1)})\cr
Number of batches stored in the archive.}

\item{\code{cols_x}}{(\code{character()}).}

\item{\code{cols_y}}{(\code{character()}).}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{Archive$new()}}
\item \href{#method-add_evals}{\code{Archive$add_evals()}}
\item \href{#method-best}{\code{Archive$best()}}
\item \href{#method-data}{\code{Archive$data()}}
\item \href{#method-format}{\code{Archive$format()}}
\item \href{#method-print}{\code{Archive$print()}}
\item \href{#method-clear}{\code{Archive$clear()}}
\item \href{#method-clone}{\code{Archive$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Creates a new instance of this \link[R6:R6Class]{R6} class.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Archive$new(search_space, codomain)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{search_space}}{(\link[paradox:ParamSet]{paradox::ParamSet})\cr
Search space that is logged into archive.}

\item{\code{codomain}}{(\link[paradox:ParamSet]{paradox::ParamSet})\cr
Specifies codomain of function, hence its feasible values.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-add_evals"></a>}}
\if{latex}{\out{\hypertarget{method-add_evals}{}}}
\subsection{Method \code{add_evals()}}{
Adds function evaluations to the archive table.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Archive$add_evals(xdt, xss_trafoed, ydt)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{xdt}}{(\code{\link[data.table:data.table]{data.table::data.table()}})\cr
Set of untransformed points / points from the \emph{search space}.
One point per row, e.g. \code{data.table(x1 = c(1, 3), x2 = c(2, 4))}.}

\item{\code{xss_trafoed}}{(\code{list()})\cr
Transformed point(s) in the \emph{domain space}.}

\item{\code{ydt}}{(\code{\link[data.table:data.table]{data.table::data.table()}})\cr
Optimal outcome.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-best"></a>}}
\if{latex}{\out{\hypertarget{method-best}{}}}
\subsection{Method \code{best()}}{
Returns the best scoring evaluation. For single-criteria optimization,
the solution that minimize/ maximize the objective function. For
multi-criteria optimization, the non-dominant solution set.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Archive$best(m = NULL)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{m}}{(\code{integer()})\cr
Take only batches \code{m} into account. Default is all batches.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
\link[data.table:data.table]{data.table::data.table}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-data"></a>}}
\if{latex}{\out{\hypertarget{method-data}{}}}
\subsection{Method \code{data()}}{
Returns a \link[data.table:data.table]{data.table::data.table} which contains all performed
\link{Objective} function calls.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Archive$data(unnest = NULL)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{unnest}}{(\code{character()})\cr
Set of column names for columns to unnest via \code{\link[mlr3misc:unnest]{mlr3misc::unnest()}}.
Unnested columns are stored in separate columns instead of list-columns.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
\link[data.table:data.table]{data.table::data.table}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-format"></a>}}
\if{latex}{\out{\hypertarget{method-format}{}}}
\subsection{Method \code{format()}}{
Helper for print outputs.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Archive$format()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-print"></a>}}
\if{latex}{\out{\hypertarget{method-print}{}}}
\subsection{Method \code{print()}}{
Printer.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Archive$print()}\if{html}{\out{</div>}}
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
\if{html}{\out{<a id="method-clear"></a>}}
\if{latex}{\out{\hypertarget{method-clear}{}}}
\subsection{Method \code{clear()}}{
Clear all evaluation results from archive.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Archive$clear()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Archive$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
