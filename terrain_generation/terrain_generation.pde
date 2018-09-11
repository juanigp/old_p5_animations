int cols, rows;
int scl=10;
int w=1600;
int h=1200;
float[][] terrain;
float xoff=10;
float yoff=10;
float flying=0;
float inc=0.02;
float hinc=200;

void setup() {
  size(800, 600, P3D);
  background(0);

  cols= w/scl;
  rows= h/scl;
  terrain= new float[cols][rows];

  // noFill();
  stroke(0);
  strokeWeight(0.5);
}

void draw() {
  background(0);
  flying-=0.03;
  yoff=flying;
  for (int y=0; y<rows; y++) {
    xoff=0;
    for (int x=0; x<cols; x++) {
      terrain[x][y]=map(noise(xoff, yoff), 0, 1, -100, 100+hinc);//noise(xoff, yoff);
      xoff+=inc;
    }
    yoff+=inc;
  }

  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/3);
  for (int y=0; y<rows-1; y++) {
    beginShape(TRIANGLE_STRIP);    
    for (int x=0; x<cols; x++) {
      fill(100,map(terrain[x][y],-100,100,0,255),map(terrain[x][y],-100,100,0,255));
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
  inc+=0.0001;
// saveFrame(); 
}

