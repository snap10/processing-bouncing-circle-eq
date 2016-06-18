void loadingCircle() {  
 
  if (circleCounter > 360) {
    circleCounter=360;
  } else {
    for (int i = 0; i < circleCounter; i += 18) {
      // thikness
      strokeWeight(thickness);
      // Draw every Line
      drawLine(i, 3, 18, maxOuterRadius);
      /*
                      i+=7;
       line(cos(radians(i + j * 1)) * innerRadius, sin(radians(i + j * 1)) * innerRadius, 0,
       cos(radians(i + j * 1)) * (innerRadius + 200),
       sin(radians(i + j * 1)) * (200 + innerRadius), 200 + 10); // draw
       i-=7;
       */
    }
  } 
  circleCounter += 18;
  System.out.println(circleCounter);
  
}



void unloadingCircle() {

  if (uncircleCounter <= 360) {
    for (int i = uncircleCounter; i<360; i += 18) {
      // thikness
      strokeWeight(thickness);
      // Draw every Line
      drawLine(i, 3, 18,maxOuterRadius);
    }
  } 
  uncircleCounter += 18;
}
