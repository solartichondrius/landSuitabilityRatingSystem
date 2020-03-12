#February 2020
#Hayden McAdam
#Available Water Holding Capacity
#The awhc values are already provided, so this function will probably
#not be used.
capacity <- function(cropType, clayAndSilt) {
  if (cropType == "SSSG") {
    awhc <- clayAndSilt
    awhc[clayAndSilt>85] <- clayAndSilt[awhc>85] * 2 + 35
    awhc[clayAndSilt<=85 & clayAndSilt>40] <- clayAndSilt[clayAndSilt<=85 & clayAndSilt>40] * 2 + 30
    awhc[clayAndSilt<=40] <- clayAndSilt[clayAndSilt<=40] * 2 + 20
  }
  return(awhc)
}