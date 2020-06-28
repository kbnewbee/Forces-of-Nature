class Mover {
  PVector loc;
  PVector vel;
  PVector acc;

  float mass;

  Mover() {
    mass = random(0.5, 4);

    loc = new PVector(random(width/2), height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = force.div(mass);
    acc.add(f);
  }

  void display() {
    noStroke();
    fill(0, 50);
    ellipse(loc.x, loc.y, mass*15, mass*15);
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void bounce() {
    if (loc.x > width - (mass*15/2) || loc.x < (mass*15/2)) vel.x *= -1;
    if (loc.y > height - (mass*15/2) || loc.y < (mass*15/2)) vel.y *= -1;
  }
}
