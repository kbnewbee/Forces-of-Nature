class Ball {

  PVector loc;
  float anglex;
  float angley;
  float ampx;
  float ampy;
  float aVelx;
  float aVely;

  Ball() {
    loc = new PVector(0, 0);
    anglex = random(1);
    angley = random(1);
    ampx = random(50, 300);
    ampy = random(50, 300);
    aVelx = random(0.1);
    aVely = random(0.05);
  }

  void oscillate() {
    loc.x = ampx*sin(anglex);
    loc.y = ampy*sin(angley);

    anglex += aVelx;
    angley += aVely;
  }

  void display() {
    stroke(0);
    fill(127, 64);
    line(0, 0, loc.x, loc.y);
    ellipse(loc.x, loc.y, 40, 40);
  }
}
