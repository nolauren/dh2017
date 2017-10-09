#' Function to convert Jstor data ngrams.
#'
#' This function takes ngrams as downloaded from JSTOR DFR and
#' converts into a format that we can pass to MALLET. Developed
#' for Introduction to Digital Humanities at the University of
#' Richmond
#'
#' @param loc     location where algorithm will be run
#'
#' @author  Lauren C. Tilton <ltilton@richmond.edu>
#' @examples
#'
#' # if you want to automate over every folder in the directory:
#' 
#'       sapply(dir(), run_mallet_preprocess)
#'
#' # if want to run directly in jstor file:
#'
#'        run_mallet_preprocess(".")
#'
#' @export
run_mallet_preprocess <- function(loc) {
	this <- getwd()
	on.exit(setwd(this))
	setwd(loc)

	#######################################################################
	these <- dir(".", recursive = TRUE, full.names = TRUE, pattern = ".txt$")
	these <- these[substr(these, 1, 5) != "./all"]

	dir.create("all_txt", FALSE)
	for (i in seq_along(these)) {
	  file.copy(these[i], sprintf("all_txt/%s", basename(these[i])))
	  if (i %% 100 == 0) cat(sprintf("Done with %05d / %05d in %s\n", i, length(these), loc))
	}

	#######################################################################
	these <- dir(".", recursive = TRUE, full.names = TRUE, pattern = ".xml$")
	these <- these[substr(these, 1, 5) != "./all"]

	dir.create("all_xml", FALSE)
	for (i in seq_along(these)) {
	  file.copy(these[i], sprintf("all_xml/%s", basename(these[i])))
	  if (i %% 100 == 0) cat(sprintf("Done with %05d / %05d in %s\n", i, length(these), loc))
	}

	#######################################################################
	dir.create("all_topic_model", FALSE)
	these <- dir("all_txt", full.names = FALSE)
	these <- these[as.numeric(stringi::stri_sub(these, -5, -5)) == 1]
	for (i in seq_along(these)) {

	  x <- readr::read_delim(sprintf("all_txt/%s", these[i]),
	         delim = "\t", col_names = FALSE,
	         col_types = readr::cols(X1 = readr::col_character(),
							         X2 = readr::col_integer()))
	  x <- mapply(function(u,v) rep(u, v), x$X1, x$X2)
	  x <- unlist(x, use.names = FALSE)
	  x <- paste(x, collapse = " ")
	  cat(x, file = sprintf("all_topic_model/%s", these[i]))

	  if (i %% 100 == 0) cat(sprintf("Done with %05d / %05d in %s\n", i, length(these), loc))
	}
}

