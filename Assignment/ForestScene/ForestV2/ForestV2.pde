//By Jacob Stenton

ArrayList<Leaf> leaves; //array list for every leaf in the scene
PVector grav, wind, gust, controlWind; //sets up forces
//float noiseScale = 0.005; // for clouds - takes to much procssing power


void setup() {
  size(1500, 750);
  frameRate(30);

  wind = new PVector(random(-0.04, 0.04), 0);//creates a vector that gives a random direction for the wind
  gust = new PVector(random(-4, 4), 0); //creates a random vector for a gust
  controlWind = new PVector(); //creates an empty vector to use for control

  leaves = new ArrayList<Leaf>(); //creates array for leaves
  grav = new PVector(0, 0.04); //creates a constant gravity vector
}

void draw() {
  backgnd();// calls function to create the scene background


  if (frameCount % 240 == 0) { // if 8 seconds have passed - 240 / 30(framrate) = 8 seconds
    wind = new PVector(random(-0.04, 0.04), 0); 
    gust = new PVector(random(-4, 4), 0);//calculate a new wind and gust vector
  }

  if (mousePressed) { //if the mouse is pressed
    controlWind = new PVector(map(mouseX, 0, width, -1, 1), map(mouseY, 0, height, 0, 0.3)); //take mouse x and y and map wind vector
  } else { //mouse isnt pressed
    controlWind = new PVector(0, 0); //no control
  }

  leaves.add(new Leaf(random(0, width), -30)); //make a new leaf and add to array - place in random position above window

  float isgust = random(0, 1000); //for random gusts

  for (Leaf leaf : leaves) {
    leaf.force(grav); //add gravity force
    leaf.force(wind); //add wind force
    leaf.force(controlWind); //add control force
    if (isgust < 1) { // 1 in 1000 every loop
      leaf.force(gust); //add gust force to leaves
    }

    leaf.update(); //update data of all leaves
    leaf.display(); //display leaves
  }

  for (int i = leaves.size() -1; i >= 0; i--) { //cycle through all leaves
    if (leaves.get(i).dead()) { //if leaf is dead - life time is up
      leaves.remove(i); //remove leaf from array
    }
  }
}


void backgnd() {
  loadPixels();
  color col1 = color(37, 84, 147);//blue
  color col2 = color(222, 222, 222);//white
  float k; //lerp amount
  for (int i = 0; i < pixels.length; i++) { //for every pixel
    k = map(i, 0, pixels.length, 0, 1); //maps i to lerp amount
    color col = lerpColor(col1, col2, k);//changes colour
    pixels[i] = col;//applies colour
  }

  //for (int i = 0; i < pixels.length; i++) {
  //  int x = i % width;
  //  int y = i / width;

  //  float noiseX = (x+frameCount) * noiseScale;
  //  float noiseY = y * noiseScale;

  //  color cloud = color(255);
  //  color clear = pixels[i];

  //  color col = lerpColor(cloud, clear, noise(noiseX, noiseY));

  //  pixels[i] = col;
  //} //TANKS frames - dont use
  
  updatePixels();

  fill(255, 215, 0, 100);
  noStroke();
  strokeWeight(10);
  circle(width-100, 700, 770);
  fill(255, 215, 0);
  circle(width-100, 700, 700); //for sun - creates two circles ontop of eachother
  fill(50,100,50);
  rect(0,height-5,width,5);//grass
}
