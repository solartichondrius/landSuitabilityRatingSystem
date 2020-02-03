# Title     : Load Files
# Objective : Loads Files, unless they are already loaded
# Created by: CurtisTh
# Created on: 1/30/2020

loadFiles <- function(...){ #can take any number of file names as arguments
  files <- c(...) #put all of the file names into a list
  for(file in files){ #for every file in the list of files
    loadFile(file)
  }
}

loadFile <- function(file){
  fileName <- sub("\\..*","",sub(".*/","",file)) #get the name of the file without the preceding folder path and .extension type
  f <- find(fileName) #try to find the file
  if(!identical(f,".GlobalEnv")){ #if the file is not already loaded
    source(file,echo=TRUE) #load the file
  }
}