class Ball {
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  color c;

  Ball() {
    loc = new PVector(0, random(100, 700));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    c =color(random(255, 25));
    mass = random(0.5, 4);
  }

  void applyForce(PVector force) {
    PVector f = force.div(mass);
    acc.add(f);
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(loc.x, loc.y, mass*10, mass*10);
  }
}
