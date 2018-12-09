# Battleship - CPE 133 Project #

This is a 10-Bit Battleship game implemented on two Basys 3 boards. The project has one "Master" board that controls the state that the game is in, and a "Slave" board. Each board holds the ship positions for its respective player, and checks to see if a ship is hit. Players use the switches on the board to select their ship positions as well as their attack positions.

Board schematics, FSM state diagram, and PMOD connection references are available on the root project level, as well as in the attached Project Report PDF.

<hr/>

To run this project, create a new project and nest this repo in the .srcs project folder.

Basys3 Board: xc7a35tcpg236-1
