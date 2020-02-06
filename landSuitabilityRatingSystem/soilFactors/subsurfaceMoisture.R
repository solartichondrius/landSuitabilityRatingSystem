#Calculate moisture factor point adjustment based on the subsurface texture.
subsurfaceMoisture <- function(surfaceClass, subsurfaceClass){
  pointAdjustment <- if (subsurfaceClass == "S" & surfaceClass == "LS") {
    5
  } else if (subsurfaceClass == "S" & surfaceClass == "SL") {
    15
  } else if (subsurfaceClass == "S" & surfaceClass == "L") {
    25
  } else if (subsurfaceClass == "S" & surfaceClass == "CL-C") {
    30
  } else if (subsurfaceClass == "LS" & surfaceClass == "S") {
    -5
  } else if (subsurfaceClass == "LS" & surfaceClass == "SL") {
    5
  } else if (subsurfaceClass == "LS" & surfaceClass == "L") {
    15
  } else if (subsurfaceClass == "LS" & surfaceClass == "CL-C") {
    20
  } else if (subsurfaceClass == "SL" & surfaceClass == "S") {
    -15
  } else if (subsurfaceClass == "SL" & surfaceClass == "LS") {
    -5
  } else if (subsurfaceClass == "SL" & surfaceClass == "L") {
    5
  } else if (subsurfaceClass == "SL" & surfaceClass == "CL-C") {
    10
  } else if (subsurfaceClass == "L" & surfaceClass == "S") {
    -25
  } else if (subsurfaceClass == "L" & surfaceClass == "LS") {
    -10
  } else if (subsurfaceClass == "L" & surfaceClass == "SL") {
    -5
  } else if (subsurfaceClass == "L" & surfaceClass == "CL=C") {
    5
  } else if (subsurfaceClass == "CL-C" & surfaceClass == "S") {
    -30
  } else if (subsurfaceClass == "CL-C" & surfaceClass == "LS") {
    -20
  } else if (subsurfaceClass == "CL-C" & surfaceClass == "SL") {
    -15
  } else if (subsurfaceClass == "CL-C" & surfaceClass == "L") {
    -5
  } else {
    0
  }
  return(pointAdjustment)
}