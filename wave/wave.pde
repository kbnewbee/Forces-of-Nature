float aVel = 0.05;
float sa = 0;

void setup() {
  size(1500, 600);
}

void draw() {
  background(255);
  translate(0, height/2);

  //perlin noise
  //noise(a)(0,1) in place of sin(a)(-1,1)

  sa += 0.02;
  float a = sa;

  for (int x = 0; x <= width; x += 5) {
    float y = map(noise(a), 0, 1, -200, 200);
    fill(127, 84);
    stroke(0);
    //noStroke();
    ellipse(x, y, 15, 15);

    a += aVel;
  }
}
