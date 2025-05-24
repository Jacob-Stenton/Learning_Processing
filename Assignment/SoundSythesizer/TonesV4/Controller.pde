//Sliders
//main controls for synth

class Slider {

  int X;
  int Y;
  int size;
  float from; //data out
  float to; //from x to x2
  float handlePos;
  boolean isX; //for axis slider sits on
  float data;
  String name;

  // ------- CONTRUCTOR ----------

  Slider (int X, int Y, int size, float from, float to, boolean isX, String name) {

    this.X = X;
    this.Y = Y;
    this.size = size;
    this.from = from;
    this.to = to;
    this.isX = isX;
    this.data = map(this.handlePos, 0, this.size, this.from, this.to); //maps position of handle to the data needed for output
    this.name = name;
  }


  //------ METHODS -------

  void update() {
    //X SLIDER
    if (this.isX) {

      //Slider bar
      noStroke();
      fill(255);
      rect(this.X, this.Y, this.size, 20, 3); //main bar for slider

      //Controlling Slider
      if (mousePressed) {//is moused pressed
        if (mouseX > this.X - 1 && mouseX < this.X + this.size + 1 && mouseY > this.Y - 20 && mouseY < this.Y + 40) { //is mounse with slider bounds
          this.handlePos = mouseX - this.X;//handle posistion set to mouse coord
        }
      }

      //slider handle
      stroke(1);
      strokeWeight(2);
      rect(this.X + this.handlePos, this.Y - 20, 20, 60, 3);//handle for slider
      this.data = map(this.handlePos, 0, this.size, this.from, this.to); //data set to handle position - mapped to data ranges

      //text
      textSize(16);
      textAlign(CENTER);
      fill(255, 0, 0);
      text(str(this.data), this.X + this.size/2, this.Y - 22); //data readout
      text(this.name, this.X + this.size/2, this.Y + 15); //name on bar
      //--

      //Y SLIDER
    } else {
      //Same as X Slider - changes to ratations
      //slider bar
      noStroke();
      fill(255);
      rect(this.X, this.Y, 20, -this.size, 3);

      //Controlling Slider
      if (mousePressed) {
        if (mouseX > this.X - 20 && mouseX < this.X + 40 && mouseY > this.Y - this.size - 1 && mouseY < this.Y + 1) {
          this.handlePos = mouseY-this.Y ;
        }
      }

      //slider handle
      stroke(1);
      strokeWeight(2);
      rect(this.X - 20, this.Y + this.handlePos, 60, 20, 3);
      this.data = map(-this.handlePos, 0, this.size, this.from, this.to);

      //text
      textSize(16);
      textAlign(CENTER);//centers text in bounds
      fill(255, 0, 0);
      text(str(this.data), this.X + 10, height - this.Y + 20); //data readout above bar
      pushMatrix();
      translate(this.X+6, this.Y-this.size/2); //tranlsates and rotates name to fit in bar
      rotate(radians(90));
      text(this.name, 0, 0);
      popMatrix();
    }
  }

  float data() {
    return this.data; //returns data from slider
  }

  void setData(float data) { //sets data and moves handle position
    this.data = data;
    if (this.isX) { //is x axis or why axis?
      this.handlePos = map(this.data, this.from, this.to, 0, this.size);
    } else {
      this.handlePos = map(-this.data, this.from, this.to, 0, this.size);
    }
  }
}
