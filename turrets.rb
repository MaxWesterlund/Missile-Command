require 'gosu'

class Turrets
    attr_reader :missiles

    def initialize
        @missiles = []
        @time_since_shoot = 0
        @cooldown = 600
    end

    def shoot (x, y)
        if (Gosu::button_down? Gosu::KB_Z) && @time_since_shoot + @cooldown < Gosu.milliseconds
            missile = Missile.new(x, y)
            missile.explode
            @missiles << missile
            @time_since_shoot = Gosu.milliseconds
        end
    end

    def draw
        @missiles.each do |element|
            element.draw
        end
    end
end