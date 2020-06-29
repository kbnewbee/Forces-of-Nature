class Pend {
  PVector bob;
  float len;
  float angle;
  float aVel;
  float aAcc;

  boolean dragging = false;

  PVector offset;

  Pend(PVector origin, float len) {
    offset = new PVector(0, 0);
    bob = new PVector(origin.x, origin.y + len);
    this.len = len;
    angle = PI/4;
    aVel = 0.0;
    aAcc = 0.0;
  }

  void clicked(float mx, float my) {
    float d = dist(mx, my, bob.x, bob.y);
    if (d < 30) {
      dragging = true;
    }
  }

  void stopDragging() {
    if (dragging) {
      dragging = false;
      aVel = 0;
    }
  }

  void drag() {
    if (dragging) {
      offset = PVector.sub(origin, new PVector(mouseX, mouseY));
      angle = atan2(-1*offset.y, offset.x)- radians(90);
      bob.x = origin.x + len*sin(angle);
      bob.y = origin.y + len*cos(angle);
      len = offset.mag();
    }
  }



  //void hover(float mx, int my) {
  //  float d = dist(mx, my, bob.x, bob.y);
  //  if (d < 15) rollover = true;
  //  else rollover = false;
  //}

  void oscillate() {
    bob.x = origin.x + len*sin(angle);
    bob.y = origin.y + len*cos(angle);

    if (!dragging) {
      aAcc = -0.5//bob.x = origin.x + len*sin(angle);
    //bob.y = origin.y + len*cos(angle)*sin(angle)/len;
      aVel += aAcc;
      angle += aVel;

      println(aVel);

      aVel *= 0.99;
    }
  }

  void display() {
    //bob.x = origin.x + len*sin(angle);
    //bob.y = origin.y + len*cos(angle);

    stroke(127);   
    line(origin.x, origin.y, bob.x, bob.y);
    ellipseMode(CENTER);
    if (dragging) fill(50);
    else fill(127);
    ellipse(bob.x, bob.y, 30, 30);
  }
}
