float w=0.01;             //velocidad angular del poligono mas lento
float pinc=0.001;         //phi=angulo que se rota el poligono
float rad=20;             //menor "radio"
float rinc=10;            //distancia entre poligonos
int num =150;             //cantidad de poligonos
int sides= 3;             //cantidad de lados
//int count=0;

Polygon[] parray= new Polygon[num];

void setup() {
  size(displayWidth, displayHeight, P3D);
  // size(600,400);
  smooth();
  background(0);
  stroke(255);
  noFill();

  for (int i=0; i<num; i++) {
    parray[i]= new Polygon(width/2, height/2, rad, sides);
    parray[i].pinc=w;                                     
    w+=pinc;                                              //cada poligono rota mas rapido
    rad+=rinc;
  }
}


void draw() {
  background(0);
  for (int i=0; i<num; i++) {
    parray[i].update();
  }
}


/******class Polygon******/
class Polygon {
  float  x, y, radius, sides, phi, pinc, rinc;
  Polygon(float x1, float y1, float r, int n) {
    x=x1;
    y=y1;
    radius=r; 
    sides=n;
    phi=0;                                          //phi=angulo que se rota cada poligono
  }

  void update() {
    pushMatrix();
    translate(x, y);
    rotate(phi);                                     
    phi+=pinc;                                       
    beginShape();
    float angle = TWO_PI / sides;
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx =   cos(a) * radius;
      float sy =  sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
    popMatrix();
  }
}

