# Forest Scene

Project by Jacob Stenton

Lastest version - [ForestV2](/Assignment/ForestScene/ForestV2/ForestV2.pde) with [leaf](Assignment/ForestScene/ForestV2/leaf.pde)

## Requirements

Written in Proccessing 4.1.2

Needs Forest and leaf files.

No other requirments

## Operation

Click on the screen to control wind.
mouse left/right - wind direction
mouse up/down - how fast they fall

## Screenshot
*whilst playing note*
![Falling Leaves](/Assignment/Images/ForestV2Screeny.PNG)
![Falling Leaves With Control](/Assignment/Images/ForestV2Screeny2.PNG)

## Design Notes

Each leaf is created with its own class and put into an array list on every draw. They are in a list so they can be deleted for performace once they have *"died"*. each leaf has a position, velocity and acceleration vector conected to it. They also have their own individual colours.
On draw they are generated just above the screen so they arent seen popping into existance. They will also teleport to the opposite side of the screen if they go off screen.

With additoin to the gradient background and sun, I tried to create clouds using noise - however this turned out to considerably drop the simulations frames so I left it commented out. I was also finding this difficult to seamlessly blend into the background.

