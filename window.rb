require 'gosu'

WIDTH = 800
HEIGHT = 800

class Window < Gosu::Window
    def initialize 
        super WIDTH, HEIGHT

        self.caption = "Missile Command"

        init_components()

        @game_over = false
    end

    def init_components
        @crosshair = Crosshair.new(WIDTH / 2, HEIGHT / 2)
        @turrets = Turrets.new
        @city = City.new(WIDTH, HEIGHT, self)
        @BombManager = BombManager.new(WIDTH, HEIGHT, @city)
    end

    def game_over
        @game_over = true
    end

    def update
        if !@game_over
            @crosshair.move
            @turrets.shoot(@crosshair.x, @crosshair.y)
            @BombManager.update_bombs(@turrets.missiles)
        elsif Gosu::button_down? Gosu::KB_RETURN
            init_components()
            @game_over = false
        end
    end

    def draw
        if !@game_over
            @crosshair.draw
            @city.draw
            @BombManager.draw_bombs
            @turrets.draw
        else
            
        end
    end
end