Liquid l, l2, l3;
Ball[] balls;

void setup() {
  size(1200, 800);
  smooth();
  l = new Liquid(500, 0, 200, height, 0.1);
  l2 = new Liquid(700, 0, 200, height, -0.02);
  l3 = new Liquid(900, 0, 200, height, 0.1);

  balls = new Ball[4];
  for (int i = 0; i< balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(0);
  l.display();
  l2.display();
  l3.display();

  for (Ball b : balls) {

    if (l.contains(b)) {
      //drag
      PVector dragForce = l.drag(b);
      b.applyForce(dragForce);
    }
    if (l2.contains(b)) {
      //drag
      PVector dragForce = l2.drag(b);
      b.applyForce(dragForce);
    }
    if (l3.contains(b)) {
      //drag
      PVector dragForce = l3.drag(b);
      b.applyForce(dragForce);
    }

    PVector g = new PVector(0.1*b.mass, 0);
    b.applyForce(g);

    b.display();
    b.move();
  }
}
