//REF
//Processing reference
//Processing - https://processing.org/reference/
//Sound - https://processing.org/reference/libraries/sound/index.html


import processing.sound.*;

SawOsc saw;
SinOsc sin;
LowPass lowpass;
float freq = 220, amp = 0.5, filterFreq = 0;
boolean sawWave =  true;
Slider freqSlider, ampSlider, filterSlider, attackSlider, sustainSlider, sustainLevelSlider, releaseSlider;
int octave = 1;
Env env;
float attackTime, sustainTime, sustainLevel, releaseTime;

Waveform waveform;
int samples = 200;

void setup() {
  size(1000, 600);

  saw = new SawOsc(this);
  sin = new SinOsc(this);
  lowpass = new LowPass(this);
  env = new Env(this);

  Sliders();
  
  saw.play();
  lowpass.process(saw, filterFreq);

  waveform = new Waveform(this, samples);
  waveform.input(saw);
}


void draw() {
  background(20, 255);
  UpdateAll();

  println(sin);
  freq = freqSlider.data();

  amp = 0;
  Buttons();
  freqSlider.setData(freq);

  lowpass.freq(filterFreq);
  saw.set(freq, amp, 0.0, 0);
  env.play(saw, attackTime, sustainTime, sustainLevel, releaseTime);

  WaveForm();
  rect(10,10,980,580,10);
  rect(50, 370, 350, 190, 5);
  rect(420, 50, 240, 510, 5);
}


void Sliders() {

  freqSlider = new Slider(450, 540, 450, 0, 880, false , "Frequency");
  ampSlider = new Slider(530, 540, 450, 0, 1, false, "Amplitude");
  filterSlider = new Slider(610, 540, 450, 0, 880, false, "LowPass");
  freqSlider.setData(55);
  ampSlider.setData(0.5);
  filterSlider.setData(150);


  
  attackSlider = new Slider(60, 420, 150, 0, 1, true, "Attack");
  sustainSlider = new Slider(240, 420, 150, 0, 1, true, "Sustain");
  sustainLevelSlider = new Slider(240, 500, 150, 0, 5, true, "Sustain Level");
  releaseSlider = new Slider(60, 500, 150, 0, 2, true, "Release");
  attackSlider.setData(0.1);
  sustainSlider.setData(0.2);
  sustainLevelSlider.setData(2);
  releaseSlider.setData(0.2);
}

void Buttons() {
  if (keyPressed) {
    if (key == 's') {
      freq = freqSlider.data();
      amp = ampSlider.data();
    }
    if (key == 'd') {
      freq = 27.50 * octave;
      amp = ampSlider.data();
    }
    if (key == 'f') {
      freq = 30.87 * octave;
      amp = ampSlider.data();
    }
    if (key == 'g') {
      freq = 32.70 * octave;
      amp = ampSlider.data();
    }
    if (key == 'h') {
      freq = 36.71 * octave;
      amp = ampSlider.data();
    }
    if (key == 'j') {
      freq = 41.20 * octave;
      amp = ampSlider.data();
    }
    if (key == 'k') {
      freq = 43.65 * octave;
      amp = ampSlider.data();
    }
    if (key == 'l') {
      freq = 49 * octave;
      amp = ampSlider.data();
    }

    if (key == 'm') {
      octave += 1;
      if (octave == 19) {
        octave += -1;
      }
      delay(50);
    }

    if (key == 'n') {
      octave += -1;
      if (octave == 0) {
        octave = 1;
      }
    }
    delay(50);
  }
}

void UpdateAll() {
  freqSlider.update();
  ampSlider.update();
  filterSlider.update();
  attackSlider.update();
  sustainSlider.update();
  sustainLevelSlider.update();
  releaseSlider.update();
  attackTime = attackSlider.data();
  sustainTime = sustainSlider.data();
  sustainLevel = sustainLevelSlider.data();
  releaseTime = releaseSlider.data();
  filterFreq = filterSlider.data();
}

void WaveForm() {
  stroke(255);
  strokeWeight(2);
  noFill();
  rect(50, 50, 350, 300, 5);
  waveform.analyze();
  beginShape();
  for (int i = 0; i < samples; i++) {
    float y = map(waveform.data[i], -1, 1, 350, 50);
    if (y > 350) {
      y = 350;
    }
    if (y < 50) {
      y = 50;
    }
    vertex(map(i, 0, samples, 50, 400), y/2 + 100);
  }
  endShape();
}
