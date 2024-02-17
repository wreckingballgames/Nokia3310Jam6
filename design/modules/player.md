# Player Module Modeling

## Summary

The player module is responsible for handling input, drawing the player object, moving the player object, targeting the freeze ability, freezing other entities, and handling player death.

## Data

- Player coordinates (x and y)
- Movement speed
- Cursor coordinates (x and y; represents the spot the player will freeze)
- Number of tries left (number of cells player may allow to die)
- Freeze cooldown (definition, is freeze on cooldown, and current elapsed cooldown)
- Controls to listen to (which inputs cause output?)
- Graphics
- Collision

## Functions

- Translate input to movement
- Update movement
- Update cursor position
- Translate input to freezing
- Freeze
- Draw the player
- Check for collisions
- Count tries
- Check lose condition (tries all used or player is assimilated)
- Pass messages to other systems (tries left to UI, lose condition to scenes, freezing to cells)