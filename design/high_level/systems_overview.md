# Freeze/Takeover High Level Systems Overview

## Player

### Input

- Nokia controls. 12 button limit, think num pad (and make that an option + WASD.) No mouse.
- Four movement buttons around a center freeze button. So, five buttons plus any UI buttons (probably just a quick restart stage button)
- Controls movement.
- Controls freezing.

### Movement

- Four direction free movement. Simulate a low-end phone game by doing movement in "steps" similar to a grid. No diagonals.
- Slow movement is part of the game's difficulty curve.

### Freezing

- Freeze cells, good or bad, which kills them and makes them disappear after feedback (killed bad cell or not?) and short period of time.
- Short cooldown between freezes.
- Cursor mode for targeting in a given range? Or just freeze the tile right in front of player?
- Combo system? Reduce cooldown faster every x combo number?

### Number Of Tries

- How many times player can allow a good cell to die, either by their hand or impostors.
- Displayed on screen, either fixed or varying based on stage, resets at the start of each stage.

### Death

- Player is able to be targeted by impostors and assimilated if they don't react and freeze the impostor quickly enough.
- Option to restart stage, return to menu, or quit game

### Bad Guy Mode?

If I go for this, it scopes the game up a lot. Can I afford that? Keep this system in mind but wait and see.

- Either transition smoothly to being an impostor and attacking cells for giggles (think Venom from Ultimate Spider-Man) on twist ending (bad guy all along) or being assimilated by an impostor.

## Cells (normal)

All of these are generic functionality that bad cells can do, too.

### Spawn

- Cells have to be placed procedurally at some point, even if only on stage generation (see Stages/Generation)
- Straightforward; place cells randomly in play area, place them in loose groups of varying amount of cells, seed impostors among them, maintain minimum distance between all cells so player can react to impostors appearing
- Perhaps conditions besides stage generation for cells to spawn?

### Movement

- Cells move around slowly in random directions
- Should appear floating, not constrained like a grid like the player
- Impostor cells go in straight lines towards their target when attacking

### Replicate

- Every x seconds a cell can decide whether or not to replicate
- By default (consider difficulty questions), fairly long time between replications and chance to replicate is weighted so it's more likely that the cell does nothing
- Whenever a cell (of any kind) replicates, the two cells move in opposite directions until they're a certain distance away (makes good cells harder to protect and less predictable, makes bad cells harder to isolate)
- Impostor cells are more likely to replicate, considering their end goal, and they may choose to replicate regularly when they make their regularly scheduled choices

### Death

- Cells may be assimilated or frozen by the player (see Cells (impostor)/Attack and Player/Freezing)
- Assimilated cells are replaced with revealed impostor cells
- Frozen cells give feedback of some kind as to whether they were impostors or not (revealed impostors don't need to do this obviously) and then disappear either way

## Cells (impostor)

They can do everything normal cells can (or else they wouldn't be very good impostors.)

### Reveal

- An impostor is revealed every x seconds
- One (or more, see Stages/Difficulty) impostor reveals and then does nothing for a very short period (probably based on difficulty; remember that the game's difficulty is tightly coupled to the player reacting to impostors with enough time to stop them)
- After initial period, impostor makes a choice

### Choices

- After initial reveal is finished (see Reveal) and every x seconds after last choice, impostor randomly chooses to pick a cell that is not a revealed impostor (see Attack) or to replicate (Cells (normal)/Replicate)
- Impostors are weighted to be more likely to assimilate cells (not much more likely) but the weighting reverses if the impostor can't "probe" a target cell in its desired range (they still have a chance to attack a cell outside the ideal range, but it is very unlikely and only happens if there are no cells in the ideal range; classic WoW hunter)

### Attack

- Impostor picks a cell within certain bounds (minimum and maximum range) and moves to assimilate it (see Movement)

## Stages

### Generation

- Could implement stage generation for endless number of procedurally generated stages
- Use a difficulty factor (see difficulty) to determine things like how many cells should be secret impostors, total number of cells, minimum distance between cells, maybe amount of tries, maybe even player freeze cooldown
- Or could simply hard-code starting state of each stage, or most parts anyway

### Restart

- Quick restart button (see input)
- Choice to restart stage on game over

### Transitions

- Finishing a stage displays a congratulations before transitioning to a new stage

### Difficulty

- Some states of the stage affect game difficulty (see generation) including a difficulty factor used for some calculations which is incremented every time a stage is completed
- Every new stage is harder than the previous one