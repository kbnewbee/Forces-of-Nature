PVector origin;
float restLen;
Mover bob;

void setup() { 
  size(640, 360);
  restLen = 200;
  origin = new PVector(width/2, 0);
  bob  = new Mover(width/2, 240);
}

void draw() {
  background(255);
  line(origin.x, origin.y, bob.loc.x, bob.loc.y);

  PVector springForce = PVector.sub(bob.loc, origin);
  float currentLen = springForce.mag();
  springForce.normalize();
  float k = 0.01;
  float disp = currentLen - restLen;
  springForce.mult(-k*disp);
  bob.applyForce(springForce);

  PVector grav = new PVector(0, 0.1);
  bob.applyForce(grav);

  if (mousePressed) {
    PVector wind = new PVector(0.1, 0);
    bob.applyForce(wind);
  }

  bob.update();
  bob.display();
}
