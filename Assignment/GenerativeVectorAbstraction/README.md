# Generative Vecotr Abstraction

Project by Jacob Stenton

Lastest version - [JacobxLazsloV3](Assignment/GenerativeVectorAbstraction/JacobxLaszloV3/JacobxLaszloV3.pde)

## Requirements

Written in Proccessing 4.1.2

No other requirments

## Operation

 - Click the screen anywhere to generate a new image
 - Press S to save and image

## Output

![product](/Assignment/GenerativeVectorAbstraction/JacobxLaszloV3/Saved/Cross.png)
![product](/Assignment/GenerativeVectorAbstraction/JacobxLaszloV3/Saved/LaszloPrint1.png)
![product](/Assignment/GenerativeVectorAbstraction/JacobxLaszloV3/Saved/LaszloPrint2.png)

## Design Notes

This project was inpsired by *László Moholy-Nagy's* [artwork](https://www.google.com/search?gs_ssp=eJzj4tTP1TcwNC_JzTNg9BLKSSyuyslXyM3PyM-p1M1LTK8EAJlzCnw&q=laszlo+moholy-nagy&rlz=1C1ONGR_en-GBGB969GB969&oq=Lasz&aqs=chrome.1.69i57j46i39i650j0i433i512j46i512l2j0i512j69i60l2.3278j0j7&sourceid=chrome&ie=UTF-8).

I primarily use vector graphics to recreate this artwork. Using the inbuilt fuctions for; ellipises, triangles, lines and quads, I created a basic version of the program which uses the random fuction to place each shape in a random position. The size of each shape, as well as the number of shapes, was also determined with random(), however this required some testing as to not have one shape overtake the entire canvas.

I wanted to add more generative elements to the project, so I set to working out colour schemes. The final version uses a theme picker which randomly generates colours for each shape based on the theme. Colour schemes are created using math to invert colours, as well as lerpColour to generate a colour inbetween to other colours.

Finally, I wanted to make the final output look a little like an actual cavas. I did this by creating a sort of noise that randomly lerps between the colour of a pixel and white.
