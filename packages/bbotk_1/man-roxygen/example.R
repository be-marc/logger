#' @examples
#' library(paradox)
#'
#' domain = ParamSet$new(list(ParamDbl$new("x", lower = -1, upper = 1)))
#'
#' search_space = ParamSet$new(list(ParamDbl$new("x", lower = -1, upper = 1)))
#'
#' codomain = ParamSet$new(list(ParamDbl$new("y", tags = "minimize")))
#'
#' objective_function = function(xs) {
#'   list(y = as.numeric(xs)^2)
#' }
#'
#' objective = ObjectiveRFun$new(fun = objective_function,
#'                               domain = domain,
#'                               codomain = codomain)
#' terminator = term("evals", n_evals = 10)
#' instance = OptimInstance$new(objective = objective,
#'                              search_space = search_space,
#'                              terminator = terminator)
#'
#' optimizer = opt("<%= id %>")
#'
#' # Modifies the instance by reference
#' optimizer$optimize(instance)
#'
#' # Returns best scoring evaluation
#' instance$result
#'
#' # Allows access of data.table of full path of all evaluations
#' instance$archive$data()
