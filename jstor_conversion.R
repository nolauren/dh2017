these <- dir(".", recursive = TRUE, full.names = TRUE, pattern = ".txt$")
these <- these[substr(these, 1, 5) != "./all"]

dir.create("all_txt", FALSE)
for (i in seq_along(these)) {
  file.copy(these[i], sprintf("all_txt/%s", basename(these[i])))
}


these <- dir(".", recursive = TRUE, full.names = TRUE, pattern = ".xml$")
these <- these[substr(these, 1, 5) != "./all"]

dir.create("all_xml", FALSE)
for (i in seq_along(these)) {
  file.copy(these[i], sprintf("all_xml/%s", basename(these[i])))
}

