import g4p_controls.*;
import de.looksgood.ani.*;

GImageButton first, second, open, close, help;

PImage imgar, imgno, imgup, imgdo, imgst, img1, img2;

int c1r = 0, c1g = 0, c1b = 255;
int c2r = 0, c2g = 0, c2b = 255;

int sf1 = 30, sf2 = 30;

int ele, cer = 0, ceg = 0, ceb = 255;

int call = 0;

int pos = 0;
int[] require = {0,0};

void setup() {
  size(600,610);
  frameRate(1);
  Ani.init(this);
  
  second = new GImageButton(this,115,210,60,60,new String [] {"2.png"});
  first = new GImageButton(this,115,310,60,60,new String [] {"1.png"});
  open = new GImageButton(this,60,410,80,80,new String [] {"open.png"});
  close = new GImageButton(this,160,410,80,80,new String [] {"close.png"});
  help = new GImageButton(this,80,510,140,80,new String [] {"help.png"});
  
  imgup = loadImage("up.png");
  imgdo = loadImage("down.png");
  imgst = loadImage("stop.png");
  img1 = loadImage("no1.png");
  img2 = loadImage("no2.png");
}

void draw() {
  background(255);
  
  // UPDATE POSITION
  if (pos == 0) {ele = 450; imgno = img1;}
  else {ele = 350; imgno = img2;}
  
  // MAIN INTERACTIVE ACTIVITIES
  int sum = require[0] + require[1];
  if (sum == 2) {
    if (pos == 0) {
      c1r = 0; c1g = 255; c1b = 0;
      c2r = 255; c2g = 0; c2b = 0;
      cer = 255; ceg = 255; ceb = 255;
      require[0] = 0;
      pos = 1;
      imgar = imgst;
      Ani.to(this,0,"sf1",30);
    }
    else {
      c2r = 0; c2g = 255; c2b = 0;
      c1r = 255; c1g = 0; c1b = 0;
      cer = 255; ceg = 255; ceb = 255;
      require[1] = 0;
      pos = 0;
      imgar = imgst;
      Ani.to(this,0,"sf2",30);
    }
  }
  if (sum == 1) {
    if (require[0] == 1) {
      if (pos == 0) {
        c1r = 0; c1g = 255; c1b = 0;
        c2r = 0; c2g = 0; c2b = 255;
        cer = 255; ceg = 255; ceb = 255;
        require[0] = 0;
        imgar = imgst;
        Ani.to(this,0,"sf1",30);
      } else {
        c1r = 255; c1g = 0; c1b = 0;
        c2r = 0; c2g = 0; c2b = 255;
        cer = 0; ceg = 0; ceb = 255;
        pos = 0;
        imgar = imgdo;
      }
    } else {
      if (pos == 1) {
        c1r = 0; c1g = 0; c1b = 255;
        c2r = 0; c2g = 255; c2b = 0;
        cer = 255; ceg = 255; ceb = 255;
        require[1] = 0;
        imgar = imgst;
        Ani.to(this,0,"sf2",30);
      } else {
        c1r = 0; c1g = 0; c1b = 255;
        c2r = 255; c2g = 0; c2b = 0;
        cer = 0; ceg = 0; ceb = 255;
        pos = 1;
        imgar = imgup;
      }
    }
  }
  if (sum == 0) {
    c1r = 0; c1g = 0; c1b = 255;
    c2r = 0; c2g = 0; c2b = 255;
    cer = 0; ceg = 0; ceb = 255;
    imgar = imgst;
  }
  
  // EMERGENCY
  if (call == 1) {
    cer = 255; ceg = 0; ceb = 0;
    textSize(24); fill(0); text("HELP is on the way", 340, 560, 500, 30);
  }
  if (call == 2) {cer = 255; ceg = 255; ceb = 255;}
  if (call == 3) {cer = 0; ceg = 0; ceb = 255;}
  
  
  
  // DRAW THE BOX
  line(300,0,300,610); line(300,300,600,300);
  textSize(16); fill(0); text("INTERFACE", 100, 10, 100, 20);
  textSize(16); fill(0); text("SIDE VIEW of INTERFACE", 350, 10, 200, 20);
  textSize(16); fill(0); text("ELEVATOR", 400, 310, 100, 20);
  
  // DRAW INTERACE
  fill(100,100,100); rect(50,50,200,550);
  image(imgar,70,80,80,80); image(imgno,150,80,80,80);      // view of direction and floor
  
  fill(c2r,c2g,c2b);            // light of the 2nd floor button
  rect(105,200,80,80);
  
  fill(c1r,c1g,c1b);            // light of the 1st floor button
  rect(105,300,80,80);
  
  // DRAW SIDE VIEW
  fill(100,100,100); rect(400,80,40,200);
  
  fill(0,0,255); rect(440,90,sf2,80);
  fill(0,0,255); rect(440,190,sf1,80);
  
  // DRAW ELEVATOR
  textSize(16); fill(0); text("1st floor", 310, 400, 100, 20);
  textSize(16); fill(0); text("2nd floor", 310, 500, 100, 20);
  
  line(400,350,550,350);
  line(400,450,550,450);
  line(400,550,550,550);
  line(400,350,400,550);
  line(550,350,550,550);
  
  fill(0,0,255); rect(400,ele,50,100);
  fill(0,0,255); rect(500,ele,50,100);
  fill(cer,ceg,ceb); rect(450,ele,50,100);
  
  //delay(1000);
  
}

// CALL THE BUTTONS
void handleButtonEvents(GImageButton button, GEvent event) {
  if(button == open) {
    call = 2;
  }
  if(button == close) {
    call = 3;
  }
  if(button == help) {
    call = 1;
  }
  
  if(button == first) {
    require[0] = 1;
    Ani.to(this,0,"sf1",10);
    call = 0;
  }
  
  if(button == second) {
    require[1] = 1;
    Ani.to(this,0,"sf2",10);
    call = 0;
  }
  
}
