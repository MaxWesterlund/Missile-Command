require 'gosu'

class Crosshair
    def initialize (x, y)
        @image = Gosu::Image.new("media/crosshair.png")
        @x = x + @image.width / 2
        @y = y - @image.height / 2
        
        @speed = 4
    end

    def move
        x = 0.0
        y = 0.0

        if Gosu::button_down? Gosu::KB_UP
            y -= 1
        end
        if Gosu::button_down? Gosu::KB_DOWN
            y += 1
        end
        if Gosu::button_down? Gosu::KB_LEFT
            x -= 1
        end 
        if Gosu::button_down? Gosu::KB_RIGHT
            x += 1
        end

        if x != 0 && y != 0
            x *= Math.sqrt(2) / 2
            y *= Math.sqrt(2) / 2
        end

        x *= @speed
        y *= @speed

        @x += x
        @y += y
    end

    def draw
        @image.draw(@x, @y)
    end

    def x
        return @x + @image.width / 2
    end

    def y
        return @y + @image.width / 2
    end
end