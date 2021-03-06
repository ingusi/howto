#---- loading packages ----
suppressPackageStartupMessages()

library(devtools)
load_all("/Users/benc/src/cmsdm/cmsdm_repo") #load package from disk

install_github('dkahle/ggmap') #note use user/repo format. Don't include e.g. https://github.com/dkahle/ggmap

#----
#---- package management ----
#----

#if r says something like 'not available for xyz version'
#http://stackoverflow.com/questions/25721884/how-should-i-deal-with-package-xxx-is-not-available-for-r-version-x-y-z-wa
# see second answer
install.packages('hypervolume',dependencies=TRUE,repos='http://cran.rstudio.com/') #seems to install all dependencies, no matter what
install.packages('hypervolume',repos='http://cran.rstudio.com/') #this is probably faster

#---- install from github ----
#note now use remote package instead of devtools
remotes::install_github('aaarchmiller/uhcplots')
#in order to build vignettes, need to supply default build_opts, but without the 'no vignette' option
#also might need build_vignette=TRUE. force=TRUE if you've already installed this package
remotes::install_github('aaarchmiller/uhcplots',build_vignettes=TRUE,force=TRUE,
                        build_opts = c("--no-resave-data", "--no-manual"))

#remotes converts all warnings to errors. This can result in failure to install if a package was built under different
# minor version (e.g. you have 3.6.1 but package was built under 3.6.2)
# to avoid this set environment variable
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS="true")
Sys.getenv('R_REMOTES_NO_ERRORS_FROM_WARNINGS')
remotes::install_github("dbspitz/migrateR/migrateR", build_vignettes = TRUE)

.libPaths() #see library paths. by default the first one is picked as the install location
#path seem to be built from here file below. see: http://stackoverflow.com/questions/6218358/how-do-i-set-r-libs-site-on-ubuntu-so-that-libpaths-is-set-properly-for-all-u
/etc/R/Renviron
#to install into a 'local' directory, these is a line like:
R_LIBS_USER=${R_LIBS_USER-'~/R/x86_64-pc-linux-gnu-library/3.2'}
#if the folder ~/R/x86_64-pc-linux-gnu-library/3.2 exists, then when you start R it will be the default place to install libraries

#my macbook pro
/Library/Frameworks/R.framework #r install from official installer
/Library/Frameworks/R.framework/Versions/Current #points to the latest version

old.packages() #check which packages are out of date
install.package('mypkg') #use install.packages to update an existing package.

#checks to see a set of libs are installed
checkInstalled <- function(libs) {
  for(lib in libs) {
    inst <- lib %in% rownames(installed.packages())
    writeLines(sprintf('Is %s installed? %s',lib,inst))
  }
}

#---- finding r from a script ----#
#
#Q: is there an equivalent way to find these from the bash command line? i.e., an environment variable that specifies where 
#the R libraries are installed if $R_LIBS and $R_LIBS_USER are not set? (I want to be able to execute an R script in the inst/ directory of an installed package) on any Unix system. – David LeBauer Jan 7 '14 at 18:07 

#A: Bubble the problem up: define R_LIBS / R_LIBS_USER somewhere else both your script and R can access -- maybe ~/.bashrc or /etc/environment. – Dirk Eddelbuettel Jan 7 '14 at 18:22

#Can access library using: 

R_HOME/library

#RHOME is:
/Library/Frameworks/R.framework/Resources

#This points to:

/Library/Frameworks/R.framework/Versions/Current/Resources

#Which contains:

/Library/Frameworks/R.framework/Versions/Current/Resources/library

#.libPaths points to this, maybe this is the same thing?
/Library/Frameworks/R.framework/Versions/3.5/Resources/library

#---- r configuration ----

#r 3.2.3 looks like it was installed by homebrew to /usr/local/Cellar/r/3.2.3. 'Cellar' is where brew puts your 'kegs'
brew list r
#https://support.rstudio.com/hc/en-us/articles/200486138-Using-Different-Versions-of-R
#I set environment variable RSTUDIO_WHICH_R to /usr/local/bin/R
#This link was set up by homebrew and links to /usr/local/Cellar/R/3.2.3/bin/R

#---- upgrading r ----
#2018-03-09 upgraded to 3.4 following this method
#http://lcolladotor.github.io/2017/05/04/Updating-R/#.WqLjpJMbOF0

installed<-dir(.libPaths())
save(installed, file='scratch/rlibs.Rdata')
getwd()

# INSTALL R FROM CRAN
# http://archive.linux.duke.edu/cran/ #Here is a mirror

load('scratch/rlibs.Rdata')

current <- dir(.libPaths())

install.packages(installed[!installed %in% current])
