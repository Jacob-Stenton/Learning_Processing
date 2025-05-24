
class Slider {

  int X;
  int Y;
  int size;
  float from;
  float to;
  float handlePos;
  boolean isX;
  float data;

  Slider (int X, int Y, int size, float from, float to, boolean isX) {

    this.X = X;
    this.Y = Y;
    this.size = size;
    this.from = from;
    this.to = to;
    this.isX = isX;
    this.data = map(this.handlePos, 0, this.size, this.from, this.to);

    if (this.isX) {
    } else {
    }
  }
  //methods
  void update() {

    if (this.isX) {
      //X SLIDER
      noStroke();
      //slider bar
      quad(this.X, this.Y, this.X + this.size, this.Y, this.X + this.size, this.Y + 20, this.X, this.Y + 20);
      stroke(1);
      strokeWeight(2);
      if (mousePressed) {
        if (mouseX > this.X - 1 && mouseX < this.X + this.size + 1 && mouseY > this.Y - 20 && mouseY < this.Y + 40) {
          this.handlePos = mouseX - this.X;
        }
      }
      //slider handle
      quad(this.X + this.handlePos, this.Y - 20, this.X + this.handlePos + 20, this.Y - 20, this.X + this.handlePos + 20, this.Y + 40, this.X + this.handlePos, this.Y + 40 );
      this.data = map(this.handlePos, 0, this.size, this.from, this.to);
    } else {
      //Y SLIDER
      noStroke();
      //slider bar
      quad(this.X, this.Y, this.X + 20, this.Y, this.X + 20, this.Y - this.size, this.X, this.Y - this.size);
      stroke(1);
      strokeWeight(2);
      if (mousePressed) {
        if (mouseX > this.X - 20 && mouseX < this.X + 40 && mouseY > this.Y - this.size - 1 && mouseY < this.Y + 1) {
          this.handlePos = mouseY-this.Y ;
        }
      }
      //sldier handle
      quad(this.X - 20, this.Y + this.handlePos, this.X + 40, this.Y + this.handlePos, this.X + 40, this.Y + this.handlePos + 20, this.X - 20, this.Y + this.handlePos + 20 );
      this.data = map(-this.handlePos, 0, this.size, this.from, this.to);
    }
  }

  float data() {
    return this.data;
  }

  void setData(float data) {
    this.data = data;
    if (this.isX) {
      this.handlePos = map(this.data, this.from, this.to, 0, this.size);
    } else {
      this.handlePos = map(-this.data, this.from, this.to, 0, this.size);
    }
  }
}

class Button {
  int X;
  int Y;
  int sizeX;
  int sizeY;
  
  
  
  
}
