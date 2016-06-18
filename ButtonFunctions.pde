//Key Handlers
void keyPressed() {
  final int k = keyCode;
  //OpenMenu
  if (k == '1') {
    go = true;
    if (showHud==true) {
      showHud = false;
      song.shiftGain(-8, 0, 500);
      song.play();
    } else {
      showHud = true;
      if (trackTime+10000>=song.length()) {
        go = false;
        song.setLoopPoints(trackTime-10000, trackTime);
        
      } else {
        song.setLoopPoints(trackTime, trackTime+10000);
      }
      /*
      if(trackTime>10000){
       song.setLoopPoints(trackTime-10000,trackTime);
       }else{
       song.setLoopPoints(0,10000);
       }
       */
      savedTrackTime=song.position();
      //lowerVolume
      song.shiftGain(0, -8, 500);
      song.loop();
    }
  }

  //Start from beginning
  if (k == '2') {
    song.rewind();
    w_height = f_height;
    zoom = true;
    //Initialize Circle
    circleCounter = 0;
    uncircleCounter=0;
    song.play();
  }
  if (k == '3') {
    song.pause();
  }
  //Pause
  if (k == 'P') {
    if (song.isPlaying()) {  
      noLoop();
      song.pause();
    } else {          
      song.play();
      loop();
    }
  }

  //Skip 10000ms
  if (k == '9') {
    //Initialize Circle
    circleCounter = 0;
    uncircleCounter=0;
    song.skip(10000);
  }
  //Back 10000ms
  if (k == '8') {
    //Initialize Circle
    circleCounter = 0;
    uncircleCounter=0;
    song.skip(-10000);
  }
  //ColorMode
  if (k=='C') {
    colorModePos=(colorModePos+1)%2;
    colorMode=colorModeList[colorModePos];
  } 
  //RandomColors True
  if (k=='X') {
    if (!randomColors) {
      setRandomColors();
      randomColors=true;
    } else { 
      randomColors=false;
    }
  } 

  //BackgroundMode
  if (k=='B') {
    backgroundMode=(backgroundMode+1)%2;
  } 
  //OuterRadiusToggle
  if (k=='O') {
    outerRadiusPos=(outerRadiusPos+1)%6;
    maxOuterRadius=outerRadiusList[outerRadiusPos];
  } 
  //OuterRadiusToggle
  if (k=='I') {
    innerRadiusPos=(innerRadiusPos+1)%6;
    initialinnerRadius=innerRadiusList[innerRadiusPos];
  }
  //Thickness
  if (k=='T') {
    thicknessPos=(thicknessPos+1)%6;
    thickness=thicknessList[thicknessPos];
  }
  //Depth
  if (k=='D') {
    depthPos=(depthPos+1)%6;
    depth=depthList[depthPos];
  }
  //PoppingFaktor
  if (k=='F') {
    poppingFaktorPos=(poppingFaktorPos+1)%6;
    poppingFaktor=poppingFaktorList[poppingFaktorPos];
  }  
  //Reset to Default
  if (k=='R') {
    reset();
  }
}

