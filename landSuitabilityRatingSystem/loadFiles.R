# Title     : Load Files
# Objective : Loads Files, unless they are already loaded
# Created by: CurtisTh
# Created on: 2020-01-30

loadFiles <- function(...,ECHO=TRUE,reload=FALSE){ #can take any number of file names as arguments
  files <- c(...) #put all of the file names into a list
  for(file in files){ #for every file in the list of files
    loadFile(file,ECHO,reload)
  }
}

loadFile <- function(file,ECHO=TRUE,reload=FALSE){
  if(reload){
    source(file,echo=ECHO)
  } else {
    fileName <- sub("\\..*","",sub(".*/","",file)) #get the name of the file without the preceding folder path and .extension type
    f <- find(fileName) #try to find the file
    if(!identical(f,".GlobalEnv")){ #if the file is not already loaded
      source(file,echo=ECHO) #load the file
    }
  }
}