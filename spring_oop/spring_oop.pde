Mover bob;

Spring spring;

void setup() {
  size(800, 600);
  bob = new Mover(width/2, 100);
  spring = new Spring(width/2-100, 0, 200);
}

void draw() {
  background(255);
  PVector grav = new PVector(0, 3);
  bob.applyForce(grav);

  spring.connect(bob);
  spring.constrainLen(bob, 20, 500);

  spring.display(bob);
  bob.display();
  bob.drag();
  bob.update();
}

void mousePressed() {
  bob.clicked(mouseX, mouseY);
}

void mouseReleased() {
  bob.stopDragging();
}
