require 'gosu'
require_relative 'player.rb'

class GameWindow < Gosu::Window
  def initialize
    super 1920, 1080
    self.caption = "It's alive!"

    @player = Player.new
    @player.spawn(320, 240)
  end

  def update 
    if Gosu::button_down? Gosu::KbLeft
      @player.left
      @player.move_horizontal
    end
    if Gosu::button_down? Gosu::KbRight
      @player.right
      @player.move_horizontal
    end
    if Gosu::button_down? Gosu::KbUp
      @player.up
      @player.move_vertical
    end
    if Gosu::button_down? Gosu::KbDown
      @player.down
      @player.move_vertical
    end
  end

  def draw
    @player.draw

  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = GameWindow.new
window.show