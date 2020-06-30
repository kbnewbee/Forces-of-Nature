//Mover m1, m2, m3, m4;
Mover[] movers;
int index = 0;
//Spring spring;
Spring[] springs;

void setup() {
  size(1000, 600);
  movers = new Mover[60];
  springs = new Spring[104];

  for (int x = 50; x <= width-50; x += 100 ) {
    for (int y = 50; y <= height-50; y += 100 ) {
      movers[index++] = new Mover(x, y);
    }
  }
  //println(index);


  for (int i = 0; i < 104; i++) {
    springs[i] = new Spring(random(90, 110));
  }

  //m1 = new Mover(200, 300);
  //m2 = new Mover(500, 300);
  //m3 = new Mover(750, 300);
  //m4 = new Mover(500, 150);

  //spring = new Spring(200);
}


void draw() {

  background(255);


  index = 0;
  //springs[0].connect(movers[0], movers[1]);
  //springs[0].display();

  for (int i= 0; i < 60; i+=6) {
    for (int j = i; j < i+5; j++ ) {
      println(j);
      springs[index++].connect(movers[j], movers[j+1]);
    }
  }

  for (int i= 0; i < 54; i+=6) {
    for (int j = i; j < i+6; j++ ) {
      println(j);
      springs[index++].connect(movers[j], movers[j+6]);
    }
  }

  for (Spring s : springs) {
    s.display();
  }
  for (Mover m : movers) {
    m.display();
    m.update();
  }

  //for(int i = 0; i<movers.length-1; i++){

  //  spring.connect(movers[i], movers[i+1]);
  //  movers[i].display();
  //}

  //spring.connect(m1, m2);
  //spring.display();
  //spring.connect(m2, m3);
  //spring.display();
  //spring.connect(m4, m2);
  //spring.display();
  //spring.connect(m4, m3);
  //spring.display();

  //PVector grav1 = new PVector(0,0.05);
  //m1.applyForce(grav1);

  //m1.display();
  //m2.display();
  //m3.display();
  //m4.display();


  //m1.update();
  //m2.update();
  //m3.update();
  //m4.update();
}
