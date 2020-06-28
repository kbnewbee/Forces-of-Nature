Mover[] movers;

void setup() {
  size(800, 600);
  movers = new Mover[5];
  for (int i = 0; i< movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  background(255);
  for (Mover m : movers) { 
    
    PVector gravity = new PVector(0, 0.1);
    gravity = gravity.mult(m.mass);
    m.applyForce(gravity);

    if (mousePressed) {
      PVector wind = new PVector(0.5, 0);
      m.applyForce(wind);
    }
    
    m.display();
    m.update();
    m.bounce();
    
  }
}
