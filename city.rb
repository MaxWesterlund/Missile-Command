require 'gosu'

class City
    attr_reader :x
    attr_reader :y

    def initialize(w, h)
        @image = Gosu::Image.new("media/city.png")

        @x = (w - @image.width) / 2
        @y = h - @image.height
    end

    def draw
        @image.draw(@x, @y)
    end

    def width
        return @image.width
    end

    def height
        return @image.height
    end
end