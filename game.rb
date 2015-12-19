require 'gosu'
require_relative 'player.rb'
require_relative 'projectile.rb'

class GameWindow < Gosu::Window
  attr_accessor :screen_x, :screen_y
  def initialize
    @screen_x = 600
    @screen_y = 800
    super @screen_x, @screen_y
    self.caption = 'Battle City!'

    @background_image = Gosu::Image.new("resources/images/battle_city.png", :tileable => true)

    # @music = Gosu::Song.new(self, "resources/audio/intro.mp3")
    # @music.play
    @opponent = Player.new
    @player = Player.new
    @player.spawn(@screen_x/2, @screen_y - 30, 0)
    @opponent.spawn(90,90,180)
    @projectiles = []
  end

  def update 
    @projectiles << Projectile.new(@opponent)

    if Gosu::button_down? Gosu::KbLeft
      @player.left
      @player.move_horizontal
    elsif Gosu::button_down? Gosu::KbRight
      @player.right
      @player.move_horizontal
    elsif Gosu::button_down? Gosu::KbUp
      @player.up
      @player.move_vertical
    elsif Gosu::button_down? Gosu::KbDown
      @player.down
      @player.move_vertical
    end

    if Gosu::button_down? Gosu::KbSpace
      manage_proj
    end
    @projectiles.each(&:move)
  end

  def draw
    @opponent.draw
    @player.draw
    @projectiles.each(&:draw)

  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

  def manage_proj
    @projectiles.delete_if {|p| p.x > @screen_x || p.x < 0 || p.y > @screen_y || p.y < 0}
    @projectiles << Projectile.new(@player) unless @projectiles.any? {|p| p.tank == @player}
  end
end

window = GameWindow.new
window.show