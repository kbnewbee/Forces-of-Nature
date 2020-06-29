class Mover {
  PVector loc;
  PVector vel;
  PVector acc;
  float G;
  float mass;

  Mover() {
    loc = new PVector(random(200, 400), random(100, 300));
    vel = new PVector(1, 0);
    acc = new PVector(0, 0);
    mass = random(5, 10);
    G = 1;
  }

  PVector attracts(Mover m) {
    PVector force = PVector.sub(loc, m.loc);
    float d = force.mag();    
    d = constrain(d, 20, 25);
    force.normalize();
    float strength =(G*m.mass*mass)/(d*d);
    force.mult(strength);
    return force;
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
    stroke(0);
    strokeWeight(2);
    fill(255, 255, 0, 64);
    ellipse(loc.x, loc.y, mass*5, mass*5);
  }

  //void checkEdges() {
  //  if (loc.x > width) {
  //    loc.x = 0;
  //  } else if (loc.x < 0) {
  //    loc.x = width;
  //  }

  //  if (loc.y > height) {
  //    loc.y = 0;
  //  } else if (loc.y < 0) {
  //    loc.y = height;
  //  }
  //}
}
