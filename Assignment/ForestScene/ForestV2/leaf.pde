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
    accel = new PVector(); //creates vectors for leafs position, velocity and acceleration
    
    size = random(20, 30);//gives the lead a random size
    life = 500; //liftime of leaf
    degrade = 1; //how fast lifetime degrades
    
    cols = new color[3]; //list of three colours
    cols[0] = color(165, 115, 0);
    cols[1] = color(0, 110, 10);
    cols[2] = color(80, 15, 0); //sets colours to list  -  green, orange, red
    
    col = cols[int(random(3))]; //randomly picks a colour for each leaf
  }
  //METHODS
  //update
  void update() {
    vel.add(accel); //adds acceleration to velocity
    
    if (pos.x > width + 20){ //if leaf goes off right side of scree
      pos.x = -20; // more to left side
    } else if (pos.x < -20){//if leaf goes of left side of scree
      pos.x = width + 20;//move to right
    }
    
    pos.add(vel); //adds velocity to position
    accel.mult(0); //sets acceleration to 0
    life -= degrade; // slowly kills leaf
  }

  //display
  void display() {

    pushMatrix();
    translate(pos.x, pos.y); //moves leaf to its vector position
    if (pos.y +(size/2) > height) { //if leave passes the floor
      pos.y = height - size/2; //puts leaf on floor
      vel.mult(0);//velocity of leaf is 0
    } else {
      rotate(vel.heading());// rotate leaf in the direction its heading
    }

    leafimage(col, size); //create lead image with random color and size
    popMatrix();
    
  }

  //add force
  void force(PVector force) {
    accel.add(force); //adds input force to acceleration
  }

  boolean dead() {
    return life < 0; //returns true if the leaf is dead
  }
}

void leafimage(color col, float size) {
  stroke(90, 60, 0);
  strokeWeight(3);
  line(-5, 0, 10, 0);
  fill(col);
  noStroke();
  ellipse(size/2, 0, size, size/2 +5); //creates leaf with size and colour
}
