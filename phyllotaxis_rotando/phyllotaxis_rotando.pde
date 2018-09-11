import processing.serial.*;

boolean flag=false;
color col;
float r0=20;
float relipse=30;
float inc=0.005;
float phi=0;
float depth=500;
int cant=500;
int[] zarray=new int[cant];     

final float pi=3.14;

void setup() {
  size(800, 600, P3D);
  ortho();
  background(25);
  smooth();
  //angleMode(DEGREES);
  colorMode(HSB);
  translate(width/2, height/2);  
  //int n=0;
  for (int i=1; i<cant; i++) {
    zarray[i]=floor(random(-depth, depth));
  }
}

void draw() {


  background(25);
  translate(width/2, height/2);
  rotateY(phi);



  for (int n=1; n<cant; n++) {
    float r=r0*sqrt(n);
    float phi=radians(n*137.5);                //phylotaxis
    float x=r*cos(phi);
    float y=r*sin(phi);
    int hue=0;

    /*
    if (x>0&&y>0) hue=floor(atan(abs(y/x))*255/(2*PI));    
     if (x<0&&y>0) hue=floor(((PI)-atan(abs(y/x)))*255/(2*PI));        //atan2();
     if (x<0&&y<0) hue=floor(((PI)+atan(abs(y/x)))*255/(2*PI));
     if (x>0&&y<0) hue=floor(((2*PI)-atan(abs(y/x)))*255/(2*PI));    
     */
    hue=floor((atan2(x, y)+PI)*255/(2*PI));                           //atan2() devuelve entre -PI y +PI
    col=color(hue, 255, 255);

    stroke(col);
    fill(col);
    pushMatrix();
    translate(0, 0, zarray[n]);
    ellipse(x, y, relipse, relipse);
    popMatrix();
  } 
  phi+=inc;


  /*  saveFrame();
   if (phi>2*PI) {noLoop();}*/
}

