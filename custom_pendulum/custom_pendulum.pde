Pend p;

PVector origin;

void setup() {
  size(800, 600);
  //p1 = new Pendulum(new PVector(width/2,0),175);

  origin = new PVector(width/2, 0);
  p = new Pend(origin, 150);
}

void draw() {
  background(255);

  p.display();
  p.oscillate();

  p.drag();
  //p.hover(mouseX, mouseY);
}

void mousePressed() {
  p.clicked(mouseX, mouseY);
}

void mouseReleased() {
  p.stopDragging();
}
