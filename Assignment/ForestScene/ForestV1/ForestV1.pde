//By Jacob Stenton

ArrayList<Leaf> leaves;
PVector grav, wind, gust;


void setup() {
  size(1500, 750);
  frameRate(30);

  wind = new PVector(random(-0.04, 0.04), 0);
  gust = new PVector(random(-4, 4), 0);

  leaves = new ArrayList<Leaf>();
  grav = new PVector(0, 0.04);
}

void draw() {
  background(10);

  if (frameCount % 240 == 0) {
    wind = new PVector(random(-0.04, 0.04), 0);
    gust = new PVector(random(-4, 4), 0);
  }

  leaves.add(new Leaf(random(-width*2, width*2), -100));

  float isgust = random(0, 1000);

  for (Leaf leaf : leaves) {
    leaf.force(grav);
    leaf.force(wind);
    if (isgust < 1) {
      leaf.force(gust);
    }

    leaf.update();
    leaf.display();
  }

  for (int i = leaves.size() -1; i >= 0; i--) {
    if (leaves.get(i).dead()) {
      leaves.remove(i);
    }
  }
}
