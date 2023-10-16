require 'gosu'

PI = 3.14159265359

class Missile
    def initialize (x, y)
        @image = Gosu::Image.new("media/circle.png")
        @d = 0.0

        @expolded = false
        @explosion_time = 0

        @x = x
        @y = y
    end

    def explode
       @expolded = true
       @explosion_time = Gosu.milliseconds
    end

    def draw
        if @expolded && Gosu.milliseconds - @explosion_time <= 2000
            t = (Gosu.milliseconds - @explosion_time) / 1000.0
            @d = Math.sin(PI / 2 * t)
        else 
            @d = 0
        end

        o = @d * @image.width / 2.0
        @image.draw(@x - o, @y - o, 0, @d, @d)
    end

    def x
        return @x + @d / 2.0
    end

    def y
        return @y + @d / 2.0
    end

    def radius
        return (@d / 2.0) * @image.width
    end
end