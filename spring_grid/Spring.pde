class Spring {
  PVector anc1;
  PVector anc2;
  float resLen;
  float k;

  Spring(float resLen) {
    anc1 = new PVector();
    anc2 = new PVector();
    this.resLen = resLen;
    k = random(0.1, 0.5);
  }

  void connect(Mover m1, Mover m2) {
    anc1 = m1.loc.get();
    anc2 = m2.loc.get();

    PVector springforce = PVector.sub(anc1, anc2);
    PVector springforce1 = PVector.sub(anc2, anc1);
    float curLen = springforce.mag();
    springforce.normalize();
    springforce1.normalize();
    float disp = curLen - resLen;
    //println(disp);
    springforce.mult(-k*disp);
    springforce1.mult(-k*disp);


    //println(springforce);
    m1.applyForce(springforce);
    m2.applyForce(springforce1);
  }

  void display() {
    stroke(2);
    line(anc1.x, anc1.y, anc2.x, anc2.y);
  }
}
