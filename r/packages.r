#----
#---- installation from code ----#
#----

#-- from local disk
library(devtools)
install_local('~/projects/anno',dependencies=FALSE,quiet=TRUE) #won't install unless code changed
library(anno)

#----
#---- developing packages
#----

#-- DESCRIPTION file

#add "Imports:" after "LazyData:", then add packages to import (seperated by commas). e.g.
Imports:
  httr,
  getPass

#update namespace file (required to export functions)
#if package is initially generated by rstudio, need to delete it before running this
devtools::document()

#----
#---- Example of Roxygen2 documentation format
#----

#' Downloads study metadata using movebank api
#'
#' @param studyid \code(integer) The id of the study
#' @param userid \code(string) Movebank user id
#' @return \code(tibble) A dataframe of information about the study
#' @examples
#' downloadStudy(<id>,"ben.s.carlson")
#' @export
#'

# Other Roxygen2 parameters

#' @importFrom readr read_csv

#get the full path of a specified file in a package
system.file("external/test.grd", package="raster")

#after updating the package, do this in rstudio
devtools::document()
devtools::build()

#----
#---- Troubleshooting
#----

#note, if you get something like "... *.rdb is corrupt" restart r session and try again
.rs.restartR()

#if strange exports are into the NAMESPACE file, make sure that there are no roxygen comments masqurading as regular comments
myfunction() {
  #' this will make weird exports!}
  
# downloadStudy.Rd is missing name/title. Skipping
# occurs if there is no description in roxygen block (i.e. the line "Download study metadata..." above)
