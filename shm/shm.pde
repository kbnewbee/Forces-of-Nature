//float angle = 0;
//float angle2 = 1;
//float amp = 150;
//float amp2 = 50;

Ball[] balls; 

void setup() {
  size(600, 600);
  balls = new Ball[10];
  for (int i =0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}
void draw() {
  background(255);
  translate(width/2, height/2);

  for (Ball b : balls) {
    b.display();
    b.oscillate();
  }



  //  float x = amp*sin(angle);
  //  float y = (amp2)*cos(angle);
  //  stroke(127);
  //  fill(127, 64);
  //  line(0, 0, x, y);
  //  ellipse(x, y, 40, 40);

  //  angle += 0.05;
  //  angle2 += 0.05;
}
