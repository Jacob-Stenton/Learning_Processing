 //-JacobxLaszlo-
//  Jacob Stenton

void setup() {
  size(700, 1000);
  noLoop();
}

void draw() {

  //colours

  int r = int(random(256));
  int g = int(random(256));
  int b = int(random(256));//sets rgb values for the starting colour

  color col1;
  color col2;
  color col3;//inits colour vars to use

  int themePick = int(random(4));//randomly selects a theme to use (out of 4)
  if (themePick == 0) {
    col1 = color(r, g, b);//colur one is the generated rgb values
    col2 = color(255 - r, 255 - g, 255 - b);//2 inverts this
    float n = int(random(0, 101));
    n = n/100;//creates a floating point value between 0 and 1
    col3 = lerpColor(col1, col2, n);//uses all these values to randomly decided a colour inbetween col1 and col2
  } else if (themePick == 1) {
    int BorW = int(random(2)); //gives 0 or 1
    col1 = lerpColor(0, 255, BorW);//uses this to decide if col1 is black or white
    col2 = color(255 - r, 255 - g, 255 - b);
    col3 = col1;
  } else if (themePick == 2) {
    col1 = color(r, g, b);
    float n = int(random(0, 101));
    n = n/100;
    col3 = color(255 - r, 255 - b, 255 - b);
    col2 = lerpColor(col1, col3, n);
  } else if (themePick == 3){
    int BorW = int(random(2));
    col1 = lerpColor(0, 255, BorW);
    col2 = color(r, g, b);
    col3 = color(r, g, b);
  } else {
    int BorW = int(random(2));
    col1 = lerpColor(0, 255, BorW);
    col2 = color(255 - col1);
    col3 = col1;
  }//variety of themes, based on the original colour

  background(col1);//backgournd set to col1
  noStroke();


  //circles
  int circleAmount = int(random(1, 4));//randomly decides the number of circles
  for (int i = 0; i < circleAmount; i++) {//loops through the number of circles
    float size = random(20, 700); //picks a random size for each cirlce

    if (i == 2) {//to add some variety, the 3rd circle places is set to col3
      fill(col3);
    } else {
      fill(col2);//otherwise it is set to col2
    }
    
    strokeWeight(int(random(0,10)));
    int colSelect = int(random(0, 3)); //random colour
    if (colSelect == 0) { //choses col1 2 or 3 
      stroke(col1);//applies to each line creates
    } else if (colSelect == 1) {
      stroke(col2);
    } else {
      stroke(col3);
    }
    
    pushMatrix();
    translate(int(random(0, width)), int(random(0, height))); //moves the circle to a random location
    ellipse(0, 0, size, size);//creates the cirlce at 0,0 with a set size
    popMatrix();
    noStroke();
  }


  //quads
  int quadAmount = int(random(1, 12));//decides the amount of quads
  for (int i = 0; i < quadAmount; i++) {
    fill(col2);
    pushMatrix();
    translate(int(random(0, width)), int(random(0, height)));//translates the quad to a random location on the canvas
    rotate(degrees(random(0, 361)));//rotates randomly between 0 and 360
    
    createQuad();//a random sized quad is made
    popMatrix();
  }
  
    //tris
  int TriAmount = int(random(1, 3));//amount of tris
  strokeWeight(0);
  for (int i = 0; i < TriAmount; i++) {
    int colSelect = int(random(0, 3));
    if (colSelect == 0) { //choses the colour
      fill(col1);//applies to each triangle made
    } else if (colSelect == 1) {
      fill(col2);
    } else {
      fill(col3);
    }

    pushMatrix();
    translate(int(random(0, width)), int(random(0, height)));//random placement
    rotate(degrees(random(0, 361)));// random rotation
    createTri();//creates a right angle triangle
    popMatrix();
  }


  //lines
  int lineAmount = int(random(1, 8));//random amount of lines
  for (int i = 0; i < lineAmount; i++) {
    int colSelect = int(random(0, 3)); //random colour
    if (colSelect == 0) { //choses col1 2 or 3 
      stroke(col1);//applies to each line creates
    } else if (colSelect == 1) {
      stroke(col2);
    } else {
      stroke(col3);
    }
    createLine();//creates the line
  }
  noStroke();

  //----------------------------------------------------------------
  //Pixels

  loadPixels();

  //noise
  for (int i = 0; i < pixels.length; i++) {
    float randlerp = int(random(15));//for each pixel decideds a lerp amount
    randlerp /= 100;//turns randler into a number between 0 and 1
    color newCol = lerpColor((pixels[i]), 255, randlerp); //uses this to create a different colour inbetween the pixels colour and white
    pixels[i] = newCol;//applies this new colour to th pixel, giving the cavas a noisy look.
  }



  updatePixels();
}
//--------------------------------------------------------------
//Functions
int saved = 0;

void mousePressed() {
  redraw();
}

void keyPressed() {
  if (key == 's'){
  save("LaszloPrint" + saved + ".png");
  saved++;
}}



void createQuad() {
  //this is creating a rhombus type shape - seen a lot in Laszlo's work
  float offset = (int(random(-100, 100))) ;//decides what the offtet should be for the corners of the quad
  //point one is 0,0
  float p2x = int(random(50, 750));//choses the x coord of point 2
  float p3x = p2x + offset; //the x coord of point 3 - made from adding the offset to point 2's x
  float p3y = int(random(10, 100));// chosses a random height for point 3
  float p4x = offset; // point 4 is 0 + the offset
  float p4y = p3y;// point 4's y is the same as point 3s
  
  quad(0, 0, p2x, 0, p3x, p3y, p4x, p4y); //creates the rhombus using all the points(at 0,0)
}


void createLine() {
  int XorY = int(random(0, 2));//decides if the line is going to run along the x or y axis
  strokeWeight(int(random(1, 20)));
  if (XorY == 0) {//line will go virtically
    int linePos = int(random(0, height));//choses a random y coord for the line to be placed on
    line(0, linePos, width, linePos);//creates the line
  } else if (XorY == 1) {//line will run horizontally
    int linePos = int(random(0, width));//random x coord
    line(linePos, 0, linePos, height);
  }
}


void createTri() {
  float p2y = int(random(40, 200));//point 2s height
  float p3x = int(random(40, 250));//point 3s width

  triangle(0, 0, 0, p2y, p3x, p2y);//creats the tri
}
