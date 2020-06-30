class Spring {
  PVector anchor;
  float resLen;
  float k;

  Spring(float x, float y, float resLen) {
    anchor = new PVector(x, y);
    this.resLen = resLen;
  }

  void connect(Mover bob) {
    PVector springForce = PVector.sub(bob.loc, anchor);
    float currentLen = springForce.mag();
    springForce.normalize();
    float k = 0.1;
    float disp = currentLen - resLen;
    springForce.mult(-k*disp);
    bob.applyForce(springForce);
  }

  void constrainLen(Mover bob, float min, float max) {
    PVector dir = PVector.sub(bob.loc, anchor);
    float d = dir.mag();
    if (d < min) {
      dir.normalize();
      dir.mult(min);
      bob.loc = PVector.add(anchor, dir);
      bob.vel.mult(0);
    } else if (d > max) {
      dir.normalize();
      dir.mult(max);
      bob.loc = PVector.add(anchor, dir);
      bob.vel.mult(0);
    }
  }

  void display(Mover bob) {
    stroke(127);
    strokeWeight(2);
    line(anchor.x, anchor.y, bob.loc.x, bob.loc.y);
  }
}
