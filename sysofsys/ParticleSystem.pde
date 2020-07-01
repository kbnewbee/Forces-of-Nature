class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem( PVector ori) {
    origin = ori.get();
    //for (int i=0; i<num; i++) {    
    particles = new ArrayList<Particle>();
    //}
  }

  void applyForce(PVector force) {
    for (Particle p : particles) {
      p.applyForce(force);
    }
  }

  void addParticle() {
    float r = random(1);
    if (r < 0.3) particles.add(new sqParticle(origin));
    else particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.display();

      p.update();

      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
