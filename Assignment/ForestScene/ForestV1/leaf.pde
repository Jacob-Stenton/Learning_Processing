class Leaf {

  PVector pos;
  PVector vel;
  PVector accel;

  float size;
  float life;
  float degrade;

  color col;
  color[] cols;

  Leaf(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector();
    size = random(10, 20);
    life = 1000;
    degrade = 1;
    cols = new color[3];
    cols[0] = color(165, 115, 0);
    cols[1] = color(0, 110, 10);
    cols[2] = color(80, 15, 0);
    col = cols[int(random(3))];
  }
  //METHODS
  //update
  void update() {
    vel.add(accel);
    pos.add(vel);
    accel.mult(0);
    life -= degrade;
  }

  //display
  void display() {

    pushMatrix();
    translate(pos.x, pos.y);
    if (pos.y +(size/2) > height) {
      pos.y = height - size/2;
      vel.mult(0);
    } else {
      rotate(vel.heading()/2);
    }

    leafimage(col);
    popMatrix();
  }

  //add force
  void force(PVector force) {
    accel.add(force);
  }

  boolean dead() {
    return life < 0;
  }
}

void leafimage(color col) {
  stroke(90, 60, 0);
  strokeWeight(3);
  line(-5, 0, 10, 0);
  fill(col);
  noStroke();
  ellipse(15, 0, 30, 20);
}
