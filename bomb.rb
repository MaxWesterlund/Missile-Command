require 'gosu'

RAD_TO_DEG = 57.2958

class Bomb
    def initialize (x, y, x_target, y_target)
        @x = x
        @y = y
        @x_target = x_target
        @y_target = y_target

        @speed = 2

        @image = Gosu::Image.new("media/bomb.png")

        xd = @x_target - @x
        yd = @y_target - @y
        d = Math.sqrt(xd * xd + yd * yd)
        @xDir = xd / d
        @yDir = yd / d
    end

    def move
        @x += @xDir * @speed
        @y += @yDir * @speed
    end

    def draw
        xd = @x_target - @x
        yd = @y_target - @y
        r = Math.atan2(yd, xd) * RAD_TO_DEG
        @image.draw_rot(@x, @y, 1, r)
    end

    def x
        return @x + 0.5
    end

    def y
        return @y + 0.5
    end
end