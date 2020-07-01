//Particle p;
ArrayList<Particle> particles; 

void setup() {
  size(600, 400);
  //p = new Particle(new PVector(width/2,20));

  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);
  particles.add(new Particle()); 

  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
    p.update();

    if (p.isDead()) {
      particles.remove(i);
    }
  }
}
