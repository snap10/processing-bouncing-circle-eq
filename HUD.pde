void hud(){

  if(backgroundMode==0){
  fill(0);
  }else{
  fill(255);
  }
      
    text("Tracktime: "+trackTime,-500,-300);
    if(backgroundMode==0) {
        text("(B) Background: Light", -500, -210);
    }else {
        text("(B) Background: Dark", -500, -210);
    }
    
    /************************************************************/
    text("(O) Outer Radius ",-500,-165);
    if(outerRadiusList[outerRadiusPos]==50){
      textFont(Font1);
      text("50",-500,-145);
      textFont(Font2);
      text("100 150 200 250 300",-475,-145);
    }
    if(outerRadiusList[outerRadiusPos]==100){
      textFont(Font1);
      text("100",-475,-145);
      textFont(Font2);
      text("50",-500,-145);
      text("150 200 250 300",-440,-145);
    }
    if(outerRadiusList[outerRadiusPos]==150){
      textFont(Font1);
      text("150",-440,-145);
      textFont(Font2);
      text("50 100",-500,-145);
      text("200 250 300",-405,-145);
    }
    if(outerRadiusList[outerRadiusPos]==200){
      textFont(Font1);
      text("200",-405,-145);
      textFont(Font2);
      text("50 100 150",-500,-145);
      text("250 300",-370,-145);
    }
    if(outerRadiusList[outerRadiusPos]==250){
      textFont(Font1);
      text("250",-370,-145);
      textFont(Font2);
      text("50 100 150 200",-500,-145);
      text("300",-335,-145);
    }
    if(outerRadiusList[outerRadiusPos]==300){
      textFont(Font1);
      text("300",-335,-145);
      textFont(Font2);
      text("50 100 150 200 250",-500,-145);
    }
    /************************************************************/
    text("(I) Inner Radius ",-500,-120);
    if(innerRadiusList[innerRadiusPos]==10){
      textFont(Font1);
      text("10",-500,-100);
      textFont(Font2);
      text("20 40 70 100 130",-475,-100);
    }
    if(innerRadiusList[innerRadiusPos]==20){
      textFont(Font1);
      text("20",-475,-100);
      textFont(Font2);
      text("10",-500,-100);
      text("40 70 100 130",-450,-100);
    }
    if(innerRadiusList[innerRadiusPos]==40){
      textFont(Font1);
      text("40",-450,-100);
      textFont(Font2);
      text("10 20",-500,-100);
      text("70 100 130",-425,-100);
    }
    if(innerRadiusList[innerRadiusPos]==70){
      textFont(Font1);
      text("70",-425,-100);
      textFont(Font2);
      text("10 20 40",-500,-100  );
      text("100 130",-400,-100);
    }
    if(innerRadiusList[innerRadiusPos]==100){
      textFont(Font1);
      text("100",-400,-100);
      textFont(Font2);
      text("10 20 40 70",-500,-100);
      text("130",-365,-100);
    }
    if(innerRadiusList[innerRadiusPos]==130){
      textFont(Font1);
      text("130",-365,-100);
      textFont(Font2);
      text("10 20 40 70 100",-500,-100);
    }
    /************************************************************/
    text("(C) Colormode",-500,-75);
    if(colorModeList[colorModePos]==true){
      textFont(Font1);
      text("true",-500,-55);
      textFont(Font2);
      text("false",-450,-55);
    }
    if(colorModeList[colorModePos]==false){
      textFont(Font1);
      text("false",-450,-55);
      textFont(Font2);
      text("true",-500,-55);
    }
    /************************************************************/
    text("(T) Thickness",-500,-30);
    if(thicknessList[thicknessPos]==1){
      textFont(Font1);
      text("1",-500,-10);
      textFont(Font2);
      text("10 20 30 40 50",-485,-10);
    }
    if(thicknessList[thicknessPos]==10){
      textFont(Font1);
      text("10",-485,-10);
      textFont(Font2);
      text("1",-500,-10);
      text("20 30 40 50",-460,-10);
    }
    if(thicknessList[thicknessPos]==20){
      textFont(Font1);
      text("20",-460,-10);
      textFont(Font2);
      text("1 10",-500,-10);
      text("30 40 50",-435,-10);
    }
    if(thicknessList[thicknessPos]==30){
      textFont(Font1);
      text("30",-435,-10);
      textFont(Font2);
      text("1 10 20",-500,-10);
      text("40 50",-410,-10);
    }
    if(thicknessList[thicknessPos]==40){
      textFont(Font1);
      text("40",-410,-10);
      textFont(Font2);
      text("1 10 20 30",-500,-10);
      text("50",-385,-10);
    }
    if(thicknessList[thicknessPos]==50){
      textFont(Font1);
      text("50",-385,-10);
      textFont(Font2);
      text("1 10 20 30 40",-500,-10);
    }
    /************************************************************/
    text("(D) Depth",-500,15);
    if(depthList[depthPos]==0){
      textFont(Font1);
      text("0",-500,35);
      textFont(Font2);
      text("10 50 100 150 200",-485,35);
    }
    if(depthList[depthPos]==10){
      textFont(Font1);
      text("10",-485,35);
      textFont(Font2);
      text("0",-500,35);
      text("50 100 150 200",-460,35);
    }
    if(depthList[depthPos]==50){
      textFont(Font1);
      text("50",-460,35);
      textFont(Font2);
      text("0 10",-500,35);
      text("100 150 200",-435,35);
    }
    if(depthList[depthPos]==100){
      textFont(Font1);
      text("100",-435,35);
      textFont(Font2);
      text("0 10 50",-500,35);
      text("150 200",-400,35);
    }
    if(depthList[depthPos]==150){
      textFont(Font1);
      text("150",-400,35);
      textFont(Font2);
      text("0 10 50 100",-500,35);
      text("200",-365,35);
    }
    if(depthList[depthPos]==200){
      textFont(Font1);
      text("200",-365,35);
      textFont(Font2);
      text("0 10 50 100 150",-500,35);
    }
    /************************************************************/
    text("(F) Poppingfaktor",-500,60);
    if(poppingFaktorList[poppingFaktorPos]==0){
      textFont(Font1);
      text("0",-500,80);
      textFont(Font2);
      text("1 2 3 5 10",-485,80);
    }
    if(poppingFaktorList[poppingFaktorPos]==1){
      textFont(Font1);
      text("1",-485,80);
      textFont(Font2);
      text("0",-500,80);
      text("2 3 5 10",-470,80);
    }
    if(poppingFaktorList[poppingFaktorPos]==2){
      textFont(Font1);
      text("2",-470,80);
      textFont(Font2);
      text("0 1",-500,80);
      text("3 5 10",-455,80);
    }
    if(poppingFaktorList[poppingFaktorPos]==3){
      textFont(Font1);
      text("3",-455,80);
      textFont(Font2);
      text("0 1 2",-500,80);
      text("5 10",-440,80);
    }
    if(poppingFaktorList[poppingFaktorPos]==5){
      textFont(Font1);
      text("5",-440,80);
      textFont(Font2);
      text("0 1 2 3",-500,80);
      text("10",-425,80);
    }
    if(poppingFaktorList[poppingFaktorPos]==10){
      textFont(Font1);
      text("10",-425,80);
      textFont(Font2);
      text("0 1 2 3 5",-500,80);
    }
    /************************************************************/
    text("(X) Random Colors",-500,105);
    
    text("(R) Reset to Default",-500,150);
        
    /*text("(I) Inner Radius: "+innerRadiusList[innerRadiusPos]+"{50,75,100,125,150,175,200}",-500,-120);
    textFont(Font2);
    text("(C) Colormode: "+colorModeList[colorModePos]+"{0,1,2,3,4,5}",-500,-90);
    text("(T) Thickness: "+thicknessList[thicknessPos]+"{1,10,20,30,40,50}",-500,-60);
    text("(D) Depth: "+depthList[depthPos]+"{0,10,50,100,150,200}",-500,-30);
    text("(P) Poppingfaktor: "+poppingFaktorList[poppingFaktorPos]+"{0,1,2,3,5,10}",-500,0);
    text("(R) Reset to Default",-500,90);
    */
  }


