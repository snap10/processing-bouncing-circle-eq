import controlP5.*;


//imports minim libary
import ddf.minim.*;
//imports anailizer
import ddf.minim.analysis.*; 
// minim libary
Minim minim;
AudioPlayer song;                                             // frequency scanner for the music
FFT fft;
ControlP5 controlP5;

final int f_innerRadiusPos = 3;
final int f_maxOuterRadiusPos = 3;
final int f_thicknessPos = 1;
final int f_depthPos = 1;
final int f_colorModePos = 0;
final int f_poppingFaktorPos = 0;
final int f_backgroundMode = 1;
final int f_cameraMode = 0;
final Boolean f_randomColors=false;
final float f_height = 2500;

//Hilfsvariablen
PFont Font1;
PFont Font2;
float w_height = f_height;
long lastTime = 0;
float intensity = 0;
int innerRadius;
int i;
int j;
int trackTime;
int savedTrackTime;
int inv = 0;
int intensityStep = 0;
int circleCounter = 0;
int uncircleCounter=0;
int[] randomValues = new int[15];
boolean introMode = false;
boolean outroMode = false;
boolean standartMode = true;
boolean go = false;
boolean zoom = true;

//Parameter
int innerRadiusPos = 3;
int[] innerRadiusList = {
  10, 20, 40, 70, 100, 130
};
int initialinnerRadius = 70;
float maxOuterRadius=200;
int outerRadiusPos = 3;
float[] outerRadiusList = {
  50, 100, 150, 200, 250, 300
};

Boolean randomColors=false;
int thicknessPos = 1;
int[] thicknessList= {
  1, 10, 20, 30, 40, 50
};
int thickness=10;
int depthPos = 1;
int[] depthList= {
  0, 10, 50, 100, 150, 200
};
int depth=10;
int cameraMode=0;
Boolean colorMode=true;
int colorModePos = 0;
Boolean[] colorModeList= {
  true, false
};
int poppingFaktorPos = 1;
float[] poppingFaktorList= {
  0, 1, 2, 3, 5, 10
};
float poppingFaktor=1;
int backgroundMode=1;
boolean showHud = false;
boolean colorChange = true;
PFont  digital;

public void setup() {

  int i= 0;
  lastTime = millis();
  Font1 = createFont("Arial Bold", 20);
  Font2 = createFont("Arial", 18);
  size(1024, 768, P3D);
  //size(1920,1080, P3D);
  smooth();
  background(0);
  camera();
  digital = createFont("digital-7", 32);
  textFont(digital);
  textSize(20);
  // the minim libary

  minim = new Minim(this);
  //we used the normal buffersize of 1024
  song = minim.loadFile("uncode.mp3");
  // the song lenth the frequency it is anazlizing
  fft = new FFT(song.bufferSize(), song.sampleRate());
}



public void draw() {
  println(w_height);
  noCursor();
  calculateIntensityStep();
  initializeFrameStage();
  checkInvert();
  fill(255);
  //text("Tracktime for Debugging: "+trackTime, -300, -300);
  if (showHud==true) {
    hud();
    stroke(100, 191);
  }
  if (trackTime > 44650 && trackTime < 45150) {
    // Loading the Circle
    loadingCircle();
    //1880 to avoid blackScreen Bug
  } else if (trackTime >= 45150 && trackTime < 45500) {
    unloadingCircle();
  } else {
    // Normal EQ Mode
    normalMode();
  }
}
void normalMode() {
  float atom = fft.specSize() / 360;
  for (int i = 0; i < atom * 360; i += 10) {
    float band = fft.getBand(i) * 10;
    intensity += band;
    float radiusf = band * band;
    if (i + j <= 80 + j) {
      radiusf = (float) (radiusf * 0.15);
    }
    if (radiusf > maxOuterRadius)
      radiusf = maxOuterRadius;

    // thikness
    strokeWeight(thickness);

    // Draw every Line
    line(cos(radians(i + j * 1)) * innerRadius, sin(radians(i + j * 1)) * innerRadius, 0, 
    cos(radians(i + j * 1)) * (radiusf + innerRadius), 
    sin(radians(i + j * 1)) * (radiusf + innerRadius), radiusf + depth); // draw
  }
  intensity = intensity / atom * 360;
}





void initializeFrameStage() {
  // Move origin to middle of canvas.
  translate(width / 2, height / 2);
  //setColors
  // setColors(colorMode);
  //Set Background
  setColors();
  //Setup Buffer for SongPosition
  fft.forward(song.mix);
  // Camera Position


  if (trackTime > 13000) {
    zoom = false;
  }
  
  if (trackTime < 13000 && go && zoom) {            //Zoomt am Anfang des Liedes von Pos 2500 auf 2500 -(40*13*5) = 
    if ( millis() - lastTime > 25 ) {
      w_height-=5;
      lastTime = millis();
    }
  }
  if (trackTime > 67000) {
    if ( millis() - lastTime > 25 ) {
      w_height+=5;
      lastTime = millis();
    }
  }

  trackTime = song.position();


  camera(((mouseX - (width/2))) * 2, 
  (mouseY - (height/2)) * 2, 
  (w_height) / tan((float) (PI * 30.0 / 180.0))
    , 0, 0, 0, 0, 2, 0);




  // Drehungsfaktor
  // j=j+faktor für geschwindigkeit der Drehung
  j = (j + 0) % 360;
  if (trackTime > 48250 && trackTime < 49050 || trackTime > 56100 && trackTime < 56900 || trackTime > 63600 && trackTime < 64300) {
    j = (j + 15) % 360;
  }
  translate(random(intensityStep * 2), random(intensityStep * 2));
  // InnerRadius
  innerRadius = initialinnerRadius;
  innerRadius = initialinnerRadius + (int)( (intensity*poppingFaktor) /10000) * intensityStep;
  intensity = 0;
}


void calculateIntensityStep() {
  if (0 <= (int) intensity / 10000 && (int) intensity / 10000 < 15) {
    intensityStep = 0;
  } else if (15 <= (int) intensity / 10000 && (int) intensity / 10000 < 30) {
    intensityStep = 1;
  } else if (30 <= (int) intensity / 10000 && (int) intensity / 10000 < 45) {
    intensityStep = 2;
  } else if (60 <= (int) intensity / 10000 && (int) intensity / 10000 < 75) {
    intensityStep = 3;
  } else {
    intensityStep = 4;
  }
}
void checkInvert() {
  if (trackTime > 30500 && trackTime < 32000 || trackTime > 34300 && trackTime < 35100
    || trackTime > 38200 && trackTime < 38600 || trackTime > 42000 && trackTime < 43000
    || trackTime > 45900 && trackTime < 46700 || trackTime > 49600 && trackTime < 50350
    || trackTime > 53500 && trackTime < 54500 || trackTime > 49600 && trackTime < 50350
    || trackTime > 57500 && trackTime < 58500 || trackTime > 61500 && trackTime < 63000) {
    if (random(10) < 8)
      invert();
  }
}


//Flashing
void invert() {
  if (inv == 0) {
    colorsDark();
    inv = 1;
  } else {
    colorsLight();
    inv = 0;
  }
}

void drawLine(int i, int amount, int step, float outerRadius) {
  for (int n=0; n<amount; n++) {
    line(cos(radians(i+(n*(float)(step/amount)) + j * 1)) * innerRadius, sin(radians(i+(n*(float)(step/amount)) + j * 1)) * innerRadius, 0, 
    cos(radians(i+(n*(float)(step/amount)) + j * 1)) * (innerRadius + outerRadius), 
    sin(radians(i+(n*(float)(step/amount)) + j * 1)) * (innerRadius + outerRadius), outerRadius + depth); // draw
  }
}

void reset() {
  innerRadiusPos= f_innerRadiusPos;
  outerRadiusPos=f_maxOuterRadiusPos;
  thicknessPos=f_thicknessPos;
  depthPos= f_depthPos;
  colorModePos= f_colorModePos;
  poppingFaktorPos= f_poppingFaktorPos;
  backgroundMode = f_backgroundMode;
  cameraMode = f_cameraMode;
  randomColors=f_randomColors;
}

