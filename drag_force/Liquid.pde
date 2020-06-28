class Liquid {
  float x, y, w, h;
  color c;

  float coeff;

  Liquid(float x, float y, float w, float h, float coeff ) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.coeff = coeff;
    c = color(random(255), random(255), random(255) );
  }

  PVector drag(Ball b) {
    float speed = b.vel.mag();
    float cont = -1*coeff*speed*speed;
    PVector force = b.vel.get();
    force.normalize();
    force.mult(cont);
    return force;
  }

  boolean contains(Ball b) {
    PVector l = b.loc;
    if (l.x > x && l.x < x+w) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(c);
    rect(x, y, w, h);
  }
}
