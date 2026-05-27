args <- commandArgs(trailingOnly = TRUE)

get_arg <- function(flag) {
    value <- args[match(flag, args) + 1]
    if (is.na(value)) {
        stop("Missing required argument: ", flag, call. = FALSE)
    }
    value
}

input <- get_arg("--input")
output <- get_arg("--output")

