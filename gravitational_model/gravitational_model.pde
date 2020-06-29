Attractor a;
//Mover m;
Mover[] movers;

void setup() {
  size(1000, 800);

  a = new Attractor();
  //m = new Mover();

  movers = new Mover[5];
  for (int i = 0; i<movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  background(0);

  //only among themselves

  //  for (int i = 0; i < movers.length; i++) {
  //    for (int j = 0; j < movers.length; j++) {
  //      if (i != j) {
  //        PVector force = movers[j].attracts(movers[i]);
  //        movers[i].applyForce(force);
  //      }
  //    }

  //    movers[i].move();
  //    movers[i].display();
  //  }

  for (int i = 0; i < movers.length; i++) {
    PVector force = a.attracts(movers[i]);
    movers[i].applyForce(force);
    movers[i].move();
    a.drag();
    a.hover(mouseX, mouseY);

    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force2 = movers[j].attracts(movers[j]);
        movers[j].applyForce(force2);
        movers[j].move();
      }
      //movers[j].display();
    }

    a.display();
    movers[i].display();
  }
}

void mousePressed() {
  a.clicked(mouseX, mouseY);
}

void mouseReleased() {
  a.stopDragging();
}
