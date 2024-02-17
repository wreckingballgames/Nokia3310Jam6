# Stage Module Modeling

## Summary

This module handles all things related to the game's stages. That includes generating/loading a stage, managing the win condition, transitioning to another stage, drawing elements of the stage.

## Data

- Difficulty factor
- Other difficulty data (generated based on difficulty factor; includes number of cells to initially place, how many of them are impostors, distance to set them apart, etc.)
- Controls (restart button)
- Current stage index (for transitioning between stages and managing difficulty and communicating certain info to UI)

## Functionality

- Generate stages
- Instruct cells to spawn (to the correct number of cells)
- Load stages
- Check if win condition is met
- Transition to new stage
- Restart stage
- Draw stage