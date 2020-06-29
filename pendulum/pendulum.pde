PVector origin;
PVector bob;
float len;

float angle;
float aVel;
float aAcc;

void setup() {
  size(800, 600);

  angle = PI/4;

  aVel = 0.0;
  aAcc = 0.0;

  len = 150;
  origin = new PVector(width/2, 0);
  bob = new PVector(width/2, len);
}

void draw() {
  background(255);

  bob.x = origin.x + len*sin(angle);
  bob.y = origin.y + len*cos(angle);

  aAcc = -0.01*sin(angle);
  aVel += aAcc;
  angle += aVel;
  
  aVel *= 0.99; 

  stroke(127);
  fill(127);
  line(origin.x, origin.y, bob.x, bob.y);
  ellipse(bob.x, bob.y, 30, 30);
}
