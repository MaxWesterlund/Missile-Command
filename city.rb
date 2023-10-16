require 'gosu'

class City
    attr_reader :x
    attr_reader :y

    def initialize(w, h, window)
        @image = Gosu::Image.new("media/city.png")

        @x = (w - @image.width) / 2
        @y = h - @image.height
        @window = window

        @max_health = 100
        @health = @max_health

        @health_bar = HealthBar.new(w, h)
    end

    def damage(amnt)
        @health -= amnt
        if (@health <= 0)
            @window.game_over()
        end
    end

    def draw
        @image.draw(@x, @y)
        @health_bar.draw(@health, @max_health)
    end

    def width
        return @image.width
    end

    def height
        return @image.height
    end
end