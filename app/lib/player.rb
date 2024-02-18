class Player
  attr_gtk

  @x = 0
  @y = 0
  @w = 8
  @h = 8
  @path = ""
  @speed = 10 # Pixels per second
  @tries = 3
  @base_freeze_cooldown = 6.0 # In seconds
  @elapsed_freeze_cooldown = 0.0 # In seconds
  # TODO: Cursor. Subclass or part of this?

  def handle_input
    # Check movement inputs
    # If a movement input is down
    #   call move(input_direction)
    # Check freeze input
    # If freeze input is down
    #   call attack()
  end

  def move(direction)
    # TODO: Free movement or grid-based?
    # Called every tick
    # Multiply direction by speed
    # If movement is horizontal
    #   Add product to player x
    # Elsif movement is vertical
    #   Add product to player y
  end

  def attack
    # If freeze cooldown is active,
    #   does nothing or gives feedback
    # Starts freeze cooldown
    # Raises a flag that collision needs
    #   to be checked at cursor location
    # If collision is detected by any
    #   cell there, the cell is frozen
  end

  def draw
    # Handle player sprite facing
    #   Flip horizontally based on
    #   facing left/right
    # Draw player sprite at player
    #   position each tick
  end

  def collision?
    # Check player collision area
    #   against every cell's collision area
    # If a collision is detected,
    #   check who player collided with
    #   and call another function accordingly
  end

  def tries_left?
    # Return if there are any tries left or not
  end

  def die
    # Clean up player and trigger game over
  end
end
