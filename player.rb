class Player
  def initialize
    @image = Gosu::Image.new 'assets/player.png'
    @x = @y = @phi = 0.0
    @vel = 1
    @score = 0
  end

  def spawn(x, y)
    @x, @y = x, y
  end

  def left
    @phi = 270
  end

  def right
    @phi = 90
  end

  def up
    @phi = 0
  end

  def down
    @phi = 180
  end

  def move_horizontal
    if @phi == 90
      @x += @vel
    else
      @x -= @vel
    end
  end

  def move_vertical
    if @phi == 0
      @y += @vel
    else
      @y -= @vel
    end
  end

  def draw
    @image.draw_rot(@x, @y, 1, @phi)
  end
end