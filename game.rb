require 'gosu'
require_relative 'player.rb'

class GameWindow < Gosu::Window
  def initialize
    #needs responsivness
    super(640, 480, false)
    self.caption = 'Battle City!'

    @background_image = Gosu::Image.new("resources/images/battle_city.png", :tileable => true)

    @music = Gosu::Song.new(self, "resources/audio/intro.mp3")
    @music.play

  end

def update
  
end

def draw
  @background_image.draw(100, 50, 0)
end

end

window = GameWindow.new
GameWindow.new.show
window.show