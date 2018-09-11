float r, tita, phi;
float inc;
float xoff=0, yoff=0, zoff=0;
float[][] noise;
PVector[][] points;
int total;
boolean flag=false;

void setup() {
  size(1200, 800, P3D); 
  // r=200;
  stroke(0);
  fill(255);
  inc=0.02;
  total=100;
  noise= new float[total+1][total+1];
  points= new PVector[total+1][total+1];
}


void draw() {

  for (int i=0; i<total+1; i++) {
    float tita=map(i, 0, total, 0, PI);
    for (int j=0; j<total+1; j++) {
      float phi=map(j, 0, total, 0, 2*PI);
      noise[i][j]=noise(tita*2, phi*2, zoff);
      r= map(noise[i][j], 0, 1, 200, 300);
      points[i][j]=new PVector(r*sin(tita)*cos(phi), r*sin(tita)*sin(phi), r*cos(tita));
      yoff+=inc;
    }
    xoff+=inc;
  }


  translate(width/2, height/2);
  rotateY(PI/2);
  background(20); 
  lights();
  for (int i=0; i<total; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j=0; j<total+1; j++) {      
      PVector v1=points[i][j];
      PVector v2=points[i+1][j];
      vertex(v1.x, v1.y, v1.z);
      vertex(v2.x, v2.y, v2.z); 
      //      phicount++;
    }
    endShape(); 
    //   titacount++;
  };
  /*
  if (zoff>2) {flag=true;};
  if (!flag) zoff+=inc;
  if (flag) zoff-=inc;
//  saveFrame();
  if (zoff<0) noLoop();
  
  */
  
  zoff+=inc;
  

}

