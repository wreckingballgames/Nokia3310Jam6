class Player
  # attr_gtk

  include Directions

  @x
  @y
  @w
  @h
  @path
  @speed # Pixels per second
  @tries
  @base_freeze_cooldown # In seconds
  @elapsed_freeze_cooldown # In seconds

  # TODO:
  # Define a field for which player
  #   which corresponds to which controller
  # Define "middle layer" for controls
  #   to architect rebinding by me or
  #   in the future by the player
  # @controls = {
  #   up: "w_scancode",
  #   down: "s_scancode",
  #   left: "a_scancode",
  #   right: "d_scancode",
  # }

  # TODO: Cursor. Subclass or part of this?

  def initialize()
    @x = 0
    @y = 0
    @w = 6
    @h = 6
    @path = "sprites/monochrome-ship.png"
    @speed = 6
    @tries = 3
    @base_freeze_cooldown = 6.0
    @elapsed_freeze_cooldown = 0.0
  end

  def handle_movement args
    # Called every tick
    direction = Directions::NEUTRAL
    # Check movement inputs
    if args.inputs.keyboard.key_down.up || args.inputs.controller_one.key_down.up
      direction = Directions::UP
    elsif args.inputs.keyboard.key_down.down || args.inputs.controller_one.key_down.down
      direction = Directions::DOWN
    elsif args.inputs.keyboard.key_down.left || args.inputs.controller_one.key_down.left
      direction = Directions::LEFT
    elsif args.inputs.keyboard.key_down.right || args.inputs.controller_one.key_down.right
      direction = Directions::RIGHT
    end
    # Apply movement
    if direction == Directions::UP
      @y += @speed
    elsif direction == Directions::DOWN
      @y -= @speed
    elsif direction == Directions::LEFT
      @x -= @speed
    elsif direction == Directions::RIGHT
      @x += @speed
    end
  end

  def check_bounds args
    if @x >= NOKIA_WIDTH
      @x = NOKIA_WIDTH - @w
    elsif @x < 0
      @x = 0
    elsif @y >= NOKIA_HEIGHT
      @y = NOKIA_HEIGHT - @h
    elsif @y < 0
      @y = 0
    end
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

  def draw args
    # Handle player sprite facing
    #   Flip horizontally based on
    #   facing left/right
    # Draw player sprite at player
    #   position each tick

    args.nokia.sprites << {x: @x, y: @y, w: @w, h: @h, path: @path}
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
