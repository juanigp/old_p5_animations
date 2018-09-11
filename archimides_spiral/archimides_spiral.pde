float xcentro, ycentro, xmax, ymax, xyrel;
float def=1.5;      //definicion de curva (nidea)
float dis=2;        //distancia espiras
int   cant=100;     //cantidad de espiras
float a, b, x, y;
float i=0;
float inc=0.001;
void setup() {
  size(800, 600);
  xcentro=  width/2;
  ycentro=  height/2;
  xmax=  width;
  ymax=  height;
  xyrel=1;  
  stroke(255);
}

void draw() {
  background(0);
  translate(xcentro, ycentro);
  for (a=0; a<cant; a+=def) {
    b=dis*a;
    x=b*cos(a);
    y=b*sin(a);
    line(0, 0, x, y);
    translate(x, y);
  }
  def=abs(cos(i))*2;
  i+=inc;
}



