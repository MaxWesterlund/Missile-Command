require 'gosu'

WIDTH = 800
HEIGHT = 800

class Window < Gosu::Window
    def initialize 
        super WIDTH, HEIGHT

        self.caption = "Missile Command"
        
        @crosshair = Crosshair.new(WIDTH / 2, HEIGHT / 2)
        @turrets = Turrets.new
        @city = City.new(WIDTH, HEIGHT)
        @bomb_manager = Bomb_Manager.new(WIDTH, HEIGHT, @city)
    end

    def update
        @crosshair.move
        @turrets.shoot(@crosshair.x, @crosshair.y)
        @bomb_manager.update_bombs(@turrets.missiles)
    end

    def draw
        @crosshair.draw
        @city.draw
        @bomb_manager.draw_bombs
        @turrets.draw
    end
end