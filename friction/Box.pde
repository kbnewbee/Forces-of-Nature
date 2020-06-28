class Box {
  PVector loc;
  PVector vel;
  PVector acc;

  Box() {
    loc = new PVector(0, 450);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void applyforce(PVector force) {
    PVector f = force;
    acc.add(f);
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void edges() {
    if (loc.x > width || loc.x < 0) vel.x *= -1;
  }

  void display() {
    noStroke();
    fill(255, 0, 0);
    rect(loc.x, loc.y, 50, 50 );
  }
}
