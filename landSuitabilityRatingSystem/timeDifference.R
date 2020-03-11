# Title     : Time Difference
# Objective : returns a string telling the time in the appropriate units
# Created by: Thomas Curtis
# Created on: 2020-02-25

timeDifference <- function(finish,start){ #takes a start and finish time as arguments to compare

  seconds <- difftime(finish,start,units="secs") #gets the time difference in seconds

  if(seconds < 60){ #if the time is less than 60 seconds
    return(paste(seconds,"seconds")) #then return the number of seconds
  } else { #but if it's longer than 60 seconds
    minutes <- floor(seconds/60) #the minutes is the number of seconds divided by 60, rounded down so it's a whole number
    seconds <- seconds - minutes*60 #the leftover seconds are the original seconds minus how many minutes we just calculated (times 60 so it's in seconds)
    if(minutes < 60){ #if the time difference is shorter than 60 minutes
      return(paste(minutes,"minutes and",seconds,"seconds")) #then return the number of minutes and seconds
    } else { #but if it's longer than 60 minutes
      hours <- floor(minutes/60) #the hours is the number of minutes divided by 60, rounded down so it's a whole number
      minutes <- minutes - hours*60 #the leftover minutes are the original minutes minus how many hours we just calculated (times 60 so it's in minutes)
      return(paste(hours,"hours and",minutes,"minutes and",seconds,"seconds")) #return the hours and the minutes and the seconds
    }
  }
}