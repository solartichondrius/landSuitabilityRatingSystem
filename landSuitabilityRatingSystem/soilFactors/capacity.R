#February 2020
#Hayden McAdam

#Calculate available water holding capacity 
#using clay and silt content (Table 4.1).

capacity <- function(cropType, claySurface, siltSurface) {
  if (cropType == "SSSG") {
    clayAndSilt <- claySurface + siltSurface
    awhc <- clayAndSilt
    awhc[clayAndSilt>85] <- clayAndSilt[awhc>85] * 2 + 35
    awhc[clayAndSilt<=85 & clayAndSilt>40] <- clayAndSilt[clayAndSilt<=85 & clayAndSilt>40] * 2 + 30
    awhc[clayAndSilt<=40] <- clayAndSilt[clayAndSilt<=40] * 2 + 20
  }
  return(awhc)
}