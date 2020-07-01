
ArrayList<ParticleSystem> systems;
ParticleSystem ps;

void setup() {
  size(600, 400);
  ps = new ParticleSystem(new PVector(width/2, 50));
  //systems = new ArrayList<ParticleSystem>();
}

void draw() {
  background(255);

  ps.addParticle();
  ps.run();
  if (keyPressed) {
    PVector wind = new PVector(0.1, 0);
    ps.applyForce(wind);
  }


  //for (ParticleSystem ps : systems) {
  //  ps.addParticle();
  //  ps.run();
  //}
}

void mousePressed() {
  //systems.add(new ParticleSystem(int(random(1, 100)), new PVector(mouseX, mouseY)));
}
