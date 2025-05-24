# Sound Synthesizer

Project by Jacob Stenton

Lastest version - [TonesV4](/Assignment/SoundSythesizer/TonesV4/TonesV4.pde) with [Controller](/Assignment/SoundSythesizer/TonesV4/TonesV4.pde)

## Requirements

Written in Proccessing 4.1.2

Need tone file and controller.

No other requirments

## Operation

Used the mouse to drage and change sliders.

"m" and "n" are used to move up and down octaves frequency ranges - similar to octaves

"s" plays the note set by the frequency slider with no alterations

"d" to "l" on the keyboard play according notes by changing the frquecny on the slider

## Screenshot
*whilst playing note*
![TonesV4](/Assignment/Images/TonesV4Screeny.PNG)

## Design Notes

The latest version of this porgram generates a saw wave to manipulate. Originally I wanted to be able to pick which wave was used, but this proved difficult in the earlier versions. This was mainly becuase of some issues I had with the lowpass filter. In the latest version however, it seems that it could be more easily added if I worked on a the code a little more.

For this project I wanted to make my own slider and button system, so I could customize them however I saw fit. I did this with a slider class with a variety of methods to display, update, set and collect information from the slider. I also attempted to make a button class but realised there wasnt much use for it in the programs current state. If I was to add more features, a button class would definetly be used.

The visual waveform for this project is an edited version of the example set on the [processing sound library](https://processing.org/reference/libraries/sound/Waveform.html). I made slight adjustments to it, so it would fit into a small box on screen.


