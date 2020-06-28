Box b;

void setup() {
  size(1600, 600);
  b = new Box();
}

void draw() {
  background(0);

  //ice
  noStroke();
  fill(255);
  rect(0, 500, width, 100);

  //sand
  noStroke();
  fill(255, 255, 0);
  rect(800, 500, 200, 20);


  if (b.loc.x > 800 && b.loc.x < 1000) {
    PVector friction = b.vel.get();
    friction.normalize();
    float mu = -0.1;
    friction.mult(mu);
    b.applyforce(friction);
  }

  if (mousePressed) {
    PVector force = new PVector(0.1, 0);
    b.applyforce(force);
  }

  b.display();
  b.move();
  b.edges();
}
