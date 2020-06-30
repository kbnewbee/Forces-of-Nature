class Mover {

  PVector loc;
  PVector vel;
  PVector acc;
  float mass;

  boolean dragging = false;
  PVector offset;

  Mover(float x, float y) {
    offset = new PVector(0, 0);
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = 30;
  }

  void clicked(float mx, float my) {
    float d = dist(mx, my, loc.x, loc.y);
    if (d < 20) {
      dragging = true;
      offset.x = loc.x - mx;
      offset.y = loc.y - my;
    }
  }

  void drag() {
    if (dragging) {
      loc.x = offset.x + mouseX;
      loc.y = offset.y + mouseY;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acc.add(f);
  }

  void update() {
    if (!dragging) {
      vel.add(acc);
      loc.add(vel);
      acc.mult(0);

      vel.x *= 0.99;
      vel.y *= 0.99;
    }
  }

  void display() {
    noStroke();
    fill(127);
    if (dragging) fill(50);
    ellipseMode(CENTER);
    ellipse(loc.x, loc.y, 40, 40);
  }
}
