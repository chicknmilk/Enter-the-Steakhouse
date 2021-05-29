# Enter the Steakhouse

[Link to Planning Document](https://docs.google.com/document/d/11vZPQI7p4fu9-Jm3V2AgnCRwOxf1TOo5luuOlPP4I3o/edit?usp=sharing)

## Group Name: Mooing Steak

## Group Members: Aaron Hsu, Yaying Liang Li

## Description:
*Enter the Steakhouse* is a roguelike bullet-hell dungeon crawler where the player will navigate through various rooms with the goal of finding and defeating the boss of the floor. As the player explores the floor, they will be faced with enemies. Each room may contain a set of enemies that differ in strength and attack patterns that the player must defeat to proceed. Other rooms may contain a shop, where the player can upgrades, or a chest, which can be opened with keys found around the floor. Each floor is procedurally generated.


## UML:
![UML](https://github.com/chicknmilk/APCSFinalProject/blob/main/uml.jpeg)


## Devlog:
### 5/24
**Aaron**: Worked on project proposal and created the room generation algorithm using BFS.

**Yaying**: Worked on project proposal.

### 5/25
**Aaron**: Worked on floor traversal. Players can now move between rooms.

**Yaying**: Worked on different Enemies. Different Enemies shoot different styles of projectiles.

### 5/26
**Aaron**: Worked on wall collisions (so that they player can't walk into walls). Corridors are now deleted if there is no adjacent room. Also new maps!

**Yaying**: Added customizable size + color feature to projectiles + fixed shoot-3-projectiles-at-a-time bug. Added collision detection for enemy projectiles.

### 5/27
**Aaron**: Player can now fall (and take damage) into pits. Also added a small GUI for the amount of health.

**Yaying**: Changed projectiles to circles. Created despawning feature when projectile collides with player, or set amount of time passes.

### 5/28
**Aaron**: Merged `map-movement` to main and solved merge conflicts.

**Yaying**: Merged `monster-examples` to main and solved merge conflicts.

### 5/29
