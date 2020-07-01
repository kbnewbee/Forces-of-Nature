class sqParticle extends Particle {


  sqParticle(PVector l) {
    super(l);
  }


  void display() {
    stroke(127);
    fill(0);

    pushMatrix();
    translate(loc.x, loc.y);
    rectMode(CENTER);
    rotate(ang);
    rect(0, 0, 10, 10);
    popMatrix();
  }
}
