//JacobxLaszlo
//look at blendmodes
//mask inverts

void setup() {
  size(550, 700);
  noLoop();
}

void draw() {

  //3 colours
  //noise

  background(255, 255, 255);

  //circles
  int circleAmount = int(random(1, 4));
  float[] circles = new float[circleAmount*3];

  for (int i = 0; i < circleAmount; i++) {
    float size = random(20, 250);
    float posX = random(0, width);
    float posY = random(0, height);
    circles[i] = posX;
    circles[i+1] = posY;
    circles[i+2] = size;

    fill(0, 0, 0);
    ellipse(posX, posY, size, size);
  }

  //quads
  int quadAmount = int(random(1, 9));

  for (int i = 0; i < quadAmount; i++) {

    pushMatrix();
    translate(int(random(0, width)), int(random(0, height)));
    rotate(radians(random(0, 360)));

    createQuad();

    popMatrix();
  }

  //lines
  int lineAmount = int(random(0, 4));

  for (int i = 0; i < lineAmount; i++) {
    int XorY = int(random(0, 2));
    strokeWeight(int(random(1, 10)));
    if (XorY == 0) {
      int linePos = int(random(0, height));
      line(0, linePos, width, linePos);
    } else if (XorY == 1) {
      int linePos = int(random(0, width));
      line(linePos, 0, linePos, height);
    }
  }


  //tris
  int TriAmount = int(random(0, 3));

  for (int i = 0; i < lineAmount; i++) {
    pushMatrix();
    translate(int(random(0, width)), int(random(0, height)));
    rotate(radians(random(0, 360)));
    createTri();
    popMatrix();
  }
}



void mousePressed() {
  redraw();
}



void createQuad() {

  float offset = (int(random(-50, 50))) ;

  float p2x = int(random(100, 600));
  float p3x = p2x + offset;
  float p3y = int(random(10, 50));
  float p4x = offset;
  float p4y = p3y;

  quad(0, 0, p2x, 0, p3x, p3y, p4x, p4y);
}

void createTri() {
  float p2y = int(random(40, 200));
  float p3x = int(random(40, 250));

  triangle(0, 0, 0, p2y, p3x, p2y);
}
