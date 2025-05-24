//REF
//Processing reference
//Processing - https://processing.org/reference/
//Sound - https://processing.org/reference/libraries/sound/index.html

//By Jacob Stenton
//Tones - sound Synthesizer

import processing.sound.*;

SawOsc saw; //Saw wave oscilator
LowPass lowpass; //lowPass fitler
float freq = 220, amp = 0.5, filterFreq = 0; //frequency, amplitude and filter cutoff - for saw wave + filter
Slider freqSlider, ampSlider, filterSlider, attackSlider, sustainSlider, sustainLevelSlider, releaseSlider; //All sliderrs for controlling the sound wave created
int octave = 1;//octaves to change
Env env;//envelop
float attackTime, sustainTime, sustainLevel, releaseTime; //variables to control evelope

Waveform waveform; //waveform for visuals
int samples = 200; //sample rate for waveform

void setup() {
  size(700, 600);

  saw = new SawOsc(this); //creates oscilator
  lowpass = new LowPass(this); //creates lowpass filter
  env = new Env(this); //creates envelop

  Sliders(); //calls function to creates all sliders and set their data
  
  saw.play();//starts/plays saw wave
  lowpass.process(saw, filterFreq);//patches the saw wave into the lowpass filter

  waveform = new Waveform(this, samples);//creates a waveform
  waveform.input(saw);//waveform takes data from sawwave
}


void draw() {
  background(20, 255);
  UpdateAll();//calls update fuction - updating all sliders

  freq = freqSlider.data(); // sets freq var to data from related slider

  amp = 0; //sets amps to 0 - stopping playback
  Buttons(); //calls functions to check which buttons are pressed
  freqSlider.setData(freq); //sets slider to stored frequency data

  lowpass.freq(filterFreq);  //sets cutoff for lowpass filter - from slider data
  saw.set(freq, amp, 0.0, 0); //sets frequency and amplitude for the saw wave
  env.play(saw, attackTime, sustainTime, sustainLevel, releaseTime);//sets envelope data - updated in UpdateAll fuction

  WaveForm(); //Call function to create waveform
  
  rect(10,10,width-20,height-20,10);//creates curved boxes - aesthetic only
  rect(50, 370, 350, 190, 5);
  rect(420, 50, 240, 510, 5);
}


void Sliders() {

  freqSlider = new Slider(450, 540, 450, 0, 880, false , "Frequency"); //Creates individual sliders
  ampSlider = new Slider(530, 540, 450, 0, 1, false, "Amplitude"); //(X, Y, Slider Size, Data From, Data To, XAxis or YAxis (X = true), Name Text)
  filterSlider = new Slider(610, 540, 450, 0, 880, false, "LowPass");
  freqSlider.setData(55);
  ampSlider.setData(0.5);
  filterSlider.setData(150); //sets default slider data


  
  attackSlider = new Slider(60, 420, 150, 0, 1, true, "Attack");
  sustainSlider = new Slider(240, 420, 150, 0, 1, true, "Sustain");
  sustainLevelSlider = new Slider(240, 500, 150, 0, 5, true, "Sustain Level");
  releaseSlider = new Slider(60, 500, 150, 0, 2, true, "Release");
  attackSlider.setData(0.1);
  sustainSlider.setData(0.2);
  sustainLevelSlider.setData(2);
  releaseSlider.setData(0.2); //sets default envelope data
}

void Buttons() {
  if (keyPressed) {
    if (key == 's') { // no calculation plays frequency set on slider
      freq = freqSlider.data();//sets freq var to slider data
      amp = ampSlider.data();//sets amps to amp slider data
    }
    if (key == 'd') { //d to l are notes
      freq = 27.50 * octave; //frequencies of notes found online multiplied by octaves - sets to freq var
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
      octave += 1; // increses ovtave
      if (octave == 19) { //doesnt pass 19
        octave += -1;
      }
      delay(50);
    }

    if (key == 'n') {
      octave += -1; //lowers octaves
      if (octave == 0) { //doesnt go below 0
        octave = 1;
      }
    }
    delay(50);
  }
}

void UpdateAll() { //updates every slider to display and set data
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

void WaveForm() { //displays waveform
  stroke(255); //code converted from Proccessing sound library on waveforms
  strokeWeight(2);
  noFill();
  rect(50, 50, 350, 300, 5); //surounding box - aesthetic
  waveform.analyze(); //analyzes saw waveform
  beginShape();//making shape for waveform
  for (int i = 0; i < samples; i++) { //increments up sample rate size
    float y = map(waveform.data[i], -1, 1, 350, 50);//plots wavefrom data to y axis
    if (y > 350) { //waveform wont leave bounds of y 350
      y = 350;
    }
    if (y < 50) { //and y 50
      y = 50;
    }
    vertex(map(i, 0, samples, 50, 400), y/2 + 100); //draws each sample 
  }
  endShape(); //ends shape
}
