require 'gosu'

class Bomb_Manager
    def initialize (w, h, city)
        @width = w
        @height = h
        @city = city
        @interval = 1000
        @last_spawn_time = 0
        @bombs = []
    end

    def update_bombs(missiles)
        if Gosu.milliseconds > @last_spawn_time + @interval
            @last_spawn_time = Gosu.milliseconds

            x = rand(0..@width)
            y = 0
            xt = rand(@city.x..@city.x + @city.width)
            yt = @height
            @bombs << Bomb.new(x, y, xt, yt)
        end

        @bombs.each_with_index do |bomb, index|
            missiles.each do |missile|
                xd = (missile.x - bomb.x).abs
                yd = (missile.y - bomb.y).abs
                d = Math.sqrt(xd * xd + yd * yd)
                if d <= missile.radius
                    @bombs.delete_at(index)
                end
            end
            if bomb.y >= @height - @city.height / 2
                @bombs.delete_at(index)
            end
            bomb.move
        end
    end

    def draw_bombs
        @bombs.each do |bomb|
            bomb.draw
        end
    end
end