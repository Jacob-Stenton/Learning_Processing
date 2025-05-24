//REF
//Processing reference
//Processing - https://processing.org/reference/
//Sound - https://processing.org/reference/libraries/sound/index.html


import processing.sound.*;

SinOsc sin;
SawOsc saw;
SqrOsc sqr;

LowPass lowpass;
float freq = 220, amp = 0.5, filterFreq = 0;
boolean sinWave =  false, sawWave =  true, sqrWave =  false;
Slider freqSlider, ampSlider, filterSlider;
Button sinButton, sawButton, sqrButton;



void setup() {
  size(1000, 600);

  sin = new SinOsc(this);
  saw = new SawOsc(this);
  sqr = new SqrOsc(this);

  lowpass = new LowPass(this);

  if (sinWave) {
    lowpass.process(sin, filterFreq);
  } else if (sawWave) {
    lowpass.process(saw, filterFreq);
  } else if (sqrWave) {
    lowpass.process(sqr, filterFreq);
  }

  freqSlider = new Slider(550, 500, 400, 0, 880, false);
  ampSlider = new Slider(650, 500, 400, 0, 1, false);
  filterSlider = new Slider(750, 500, 400, 0, 880, false);
  freqSlider.setData(freq);
  ampSlider.setData(amp);
  filterSlider.setData(filterFreq);
  
  sinButton = new Button(50,500,140,70,false, sinWave);
  sawButton = new Button(200,500,140,70,false, sawWave);
  sqrButton = new Button(350,500,140,70,false, sqrWave);
}


void draw() {
  background(20, 255);

  freqSlider.update();
  ampSlider.update();
  filterSlider.update();
  
  sinButton.update();
  sawButton.update();
  sqrButton.update();

  freq = freqSlider.data();
  amp = ampSlider.data();
  filterFreq = filterSlider.data();
  
  if (sinButton.data()){
    sinWave = true;
    sawWave = false;
    sqrWave = false;
  }else if (sawButton.data()){
    sinWave = false;
    sawWave = true;
    sqrWave = false;
  }else if (sqrButton.data()){
    sinWave = false;
    sawWave = false;
    sqrWave = true;
  }

  setwave();

  lowpass.freq(filterFreq);
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
  if (sinWave) {
    sin.play();
  } else if (sawWave) {
    saw.play();
  } else if (sqrWave) {
    sqr.play();
  }
}

void stopwave() {
  if (sinWave) {
    sin.stop();
  } else if (sawWave) {
    saw.stop();
  } else if (sqrWave) {
    sqr.stop();
  }
}

void setwave() {
  sin.set(freq, amp, 0.0, 0);
  saw.set(freq, amp, 0.0, 0);
  sqr.set(freq, amp, 0.0, 0);
}
