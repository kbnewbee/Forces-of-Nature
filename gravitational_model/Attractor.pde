class Attractor {
  PVector loc;
  float mass;
  float G;

  boolean dragging  = false;
  boolean rollover  = false;
  PVector dragOffset;


  Attractor() {
    loc = new PVector(width/2, height/2);
    mass = 50;
    G = 1;
    dragOffset = new PVector(0, 0);
  }

  PVector attracts(Mover m) {

    PVector force = PVector.sub(loc, m.loc);
    float d  = force.mag();
    d = constrain(d, 5, 25);
    force.normalize();

    float strength = (G*mass*m.mass)/(d*d);
    force.mult(strength);

    return force;
  }

  void display() {
    ellipseMode(CENTER);
    stroke(0);
    strokeWeight(2);
    if (rollover) fill(197, 0, 0);
    else  fill(255, 0, 0);
    ellipse(loc.x, loc.y, mass*2, mass*2);
  }

  //mouse interaction

  void clicked(int mx, int my) {
    float d = dist(mx, my, loc.x, loc.y);
    if (d < mass) {
      dragging = true;
      println(dragging);
      dragOffset.x = loc.x - mx;
      dragOffset.y = loc.y - my;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag() {
    if (dragging) {

      loc.x = mouseX + dragOffset.x;
      loc.y = mouseY + dragOffset.y;
    }
  }

  void hover(int mx, int my) {
    float d = dist(mx, my, loc.x, loc.y);
    if (d < mass) rollover = true;
    else rollover = false;
  }
}
