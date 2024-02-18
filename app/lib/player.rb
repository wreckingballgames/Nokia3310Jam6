class Player
  # attr_gtk

  include Directions

  @x
  @y
  @w
  @h
  @path
  @facing
  @speed # Pixels per second
  @tries
  @base_freeze_cooldown # In seconds
  @elapsed_freeze_cooldown # In seconds

  # Cursor Information
  @cursor_x
  @cursor_y
  @cursor_w
  @cursor_h
  @cursor_path

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
    @facing = Directions::RIGHT
    @speed = 6
    @tries = 3
    @base_freeze_cooldown = 6.0
    @elapsed_freeze_cooldown = 0.0

    # Cursor setup
    @cursor_x = @x + @w
    @cursor_y = 0
    @cursor_w = @w
    @cursor_h = @h
    @cursor_path = "sprites/square/black.png"
  end

  def handle_movement args
    # Called every tick
    @facing = Directions::NEUTRAL
    # Check movement inputs
    if args.inputs.keyboard.key_down.up || args.inputs.controller_one.key_down.up
      @facing = Directions::UP
    elsif args.inputs.keyboard.key_down.down || args.inputs.controller_one.key_down.down
      @facing = Directions::DOWN
    elsif args.inputs.keyboard.key_down.left || args.inputs.controller_one.key_down.left
      @facing = Directions::LEFT
    elsif args.inputs.keyboard.key_down.right || args.inputs.controller_one.key_down.right
      @facing = Directions::RIGHT
    end
    # Apply movement
    if @facing == Directions::UP
      @y += @speed
    elsif @facing == Directions::DOWN
      @y -= @speed
    elsif @facing == Directions::LEFT
      @x -= @speed
    elsif @facing == Directions::RIGHT
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

  def update_cursor
    # Check player facing
    if @facing == Directions::UP
      @cursor_x = @x
      @cursor_y = @y + @h
    elsif @facing == Directions::DOWN
      @cursor_x = @x
      @cursor_y = @y - @h
    elsif @facing == Directions::LEFT
      @cursor_x = @x - @w
      @cursor_y = @y
    elsif @facing == Directions::RIGHT
      @cursor_x = @x + @w
      @cursor_y = @y
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

  def draw_tick args
    draw args
    draw_cursor args
  end

  def draw args
    # Handle player sprite facing
    #   Flip horizontally based on
    #   facing left/right
    # Draw player sprite at player
    #   position each tick

    args.nokia.sprites << {x: @x, y: @y, w: @w, h: @h, path: @path}
  end

  def draw_cursor args
    args.nokia.sprites << {x: @cursor_x, y: @cursor_y, w: @cursor_w, h: @cursor_h, path: @cursor_path}
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
