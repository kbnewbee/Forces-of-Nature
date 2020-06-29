float a=0;
float avel=0;
float aacc=0.01;
float r = 150;

void setup() {
  size(600, 400);
}
void draw() {
  background(255);



  //noStroke();
  fill(127);
  translate(width/2, height/2);
  float x = r*cos(a);
  float y = r*sin(a);
  stroke(0);
  line(0, 0, x, y);
  ellipse(x, y, 50, 50);

  aacc = map(mouseX, 0, width, -0.001, 0.001);
  a += avel;
  avel += aacc;

  //rectMode(CENTER);
  //rotate(a);
  //rect(0, 0, 50, 30);
}
