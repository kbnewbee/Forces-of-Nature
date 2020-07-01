class  Particle {
  PVector loc;
  PVector vel;
  PVector acc;

  float lifespan = 255;

  Particle() {
    //loc = l.get();
    loc = new PVector(width/2, 50);
    acc = new PVector(0, 0.1);
    vel = new PVector(random(-1, 1), random(-2, -0.5));
  }

  boolean isDead() {
    if (lifespan < 0) return true;
    else return false;
  }

  void display() {
    noStroke();
    strokeWeight(2);
    fill(127, lifespan);
    ellipse(loc.x, loc.y, 10, 10);
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    lifespan -= 2;
  }
}
