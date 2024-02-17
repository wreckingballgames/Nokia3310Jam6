# Cells Module Modeling

## Summary

The cells module is responsible for both normal cells and impostor cells. For all cells, this module handles spawning cells in the world, moving the cells, managing cell replication, and handling cell death.

For impostor cells, this module handles "tells" before being revealed (false positive tells may be handled by generic cells), revealing impostors, making choices (to attack other cells or replicate) on a regular schedule, and attacking other cells.

## Data

### All Cells

- Whether or not cell is an impostor (decided on cell spawn)
- Time between decisions (normal cells may choose to replicate or randomly move on a fixed schedule, impostors make other decisions too)
- Probability to replicate
- Cell coordinates (x and y)
- Movement speed
- Graphics
- Collision

### Impostors

- Desired range (distance to target cells)
- Current imperative (what am I doing right now?)
- Probability to attack instead of replicating

## Functionality

### All Cells

- Spawn
- Make a choice (replicate or move)
- Update movement
- Replicate
- Draw cell
- Check for collisions
- Pass messages to other systems (died and whether or not it was a valid kill, etc.)

### Impostors

- Make a choice (replicate or attack)
- Attack
- Pass messages (died, I killed you, etc.)