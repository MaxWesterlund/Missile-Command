require 'gosu'

class HealthBar
    def initialize(w, h)
        @h = h
        @w = w

        @width = 600
        @height = 50
    end

    def draw(health, max)
        p = health.to_f / max
        w = @width * p
        x = (@w - w) / 2
        Gosu::draw_rect(x, 10, w, @height, Gosu::Color.argb(0xff_631111))
    end
end