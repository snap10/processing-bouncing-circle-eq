void setColors(){
if(randomColors==true) colorsRandom();
else if(backgroundMode==1) colorsDark();
else colorsLight();
}

void setRandomColors(){
  //Generate 13 Random Int Values from 0-255
for(i=0;i<15;i++){
  randomValues[i]= int(random(255));
}
}


//RandomColorMode
void colorsRandom(){
            background(randomValues[0],randomValues[13],randomValues[14]);
            if(trackTime>45950 && colorChange == true){
            switch (intensityStep) {
            case 0:
              stroke(randomValues[1],randomValues[2],randomValues[3]);
              break;
            case 1:
          stroke(randomValues[4],randomValues[5],randomValues[6]);    break;
            case 2:
          stroke(randomValues[7],randomValues[8],randomValues[9]);    break;
            case 3:
          stroke(randomValues[10],randomValues[11],randomValues[12]);    break;
            }
            }else{
              stroke(randomValues[1],randomValues[2],randomValues[3]);
            }
} 
//BlackbackgroundMode
void colorsDark() {
          background(0);
          if(trackTime>45950 && colorChange == true){
          switch (intensityStep) {
          case 0:
            stroke(220);
            break;
          case 1:
            stroke(80, 40, 255);
            break;
          case 2:
            stroke(50, 170, 180);
            break;
          case 3:
            stroke(255, 70, 80);
            break;
          }
          }else{
           stroke(220);
          }
}
//WhiteBackgroundMode
void colorsLight() {
          background(255);
          if(trackTime>45950 && colorChange == true){
          switch (intensityStep) {
          case 0:
            stroke(0);
            break;
          case 1:
            stroke(80, 40, 255);
            break;
          case 2:
            stroke(50, 170, 180);
            break;
          case 3:
            stroke(255, 70, 80);
            break;
          }
          }else{
           stroke(0);
          }
}

