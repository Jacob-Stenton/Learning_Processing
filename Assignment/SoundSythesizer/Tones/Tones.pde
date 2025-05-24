//REF
//Processing reference
//Processing - https://processing.org/reference/
//Sound - https://processing.org/reference/libraries/sound/index.html


import processing.sound.*;

SinOsc sin;
SawOsc saw;
SqrOsc sqr;

LowPass lowpass;

float freq = 220;
float amp = 0.5;
float filterFreq = 0;


boolean[] waves =  new boolean [3];

Slider freqSlider;
Slider ampSlider;
Slider filterSlider;



void setup() {
  size(1000, 600);

  sin = new SinOsc(this);
  saw = new SawOsc(this);
  sqr = new SqrOsc(this);

  lowpass = new LowPass(this);

  lowpass.process(saw, 600);

  waves[0] = false;
  waves[1] = true;
  waves[2] = false;

  freqSlider = new Slider(550, 500, 400, 0, 880, false);
  ampSlider = new Slider(650, 500, 400, 0, 1, false);
  filterSlider = new Slider(750, 500, 400, 0, 800, false);
  freqSlider.setData(freq);
  ampSlider.setData(amp);
  filterSlider.setData(filterFreq);
  
}

void draw() {
  background(20, 255);

  freqSlider.update();
  ampSlider.update();
  filterSlider.update();

  freq = freqSlider.data();
  amp = ampSlider.data();
  filterFreq = filterSlider.data();

  setwave();

  lowpass.freq(filterFreq);


  println(filterFreq);
}

// keys

void keyPressed() {
  if (key == 's') {
    playwave();
    
  }
}

void keyReleased() {
  if (key == 's') {
    stopwave();
    setup();
  }
}

void playwave() {
  if (waves[0]) {
    sin.play();
  } else if (waves[1]) {
    saw.play();
  } else if (waves[2]) {
    sqr.play();
  }
}

void stopwave() {
  if (waves[0]) {
    sin.stop();
  } else if (waves[1]) {
    saw.stop();
  } else if (waves[2]) {
    sqr.stop();
  }
}

void setwave() {
  sin.set(freq, amp, 0.0, 0);
  saw.set(freq, amp, 0.0, 0);
  sqr.set(freq, amp, 0.0, 0);
}
