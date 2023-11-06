require 'gosu'

class GameOverScreen
    def initialize(w, h)
        @w = w
        @h = h

        font_options = Hash.new()
        @title_font = Gosu::Font.new(50, font_options)
        @paragraph_font = Gosu::Font.new(20, font_options)
    end

    def draw
        draw_text_center("Game Over", @title_font, @h / 2)
        draw_text_center("Press Enter To Respawn", @paragraph_font, @h / 2 + 40)
    end

    def draw_text_center(text, font, y)
        x_off = -font.text_width(text) / 2
        y_off = -font.height
        font.draw_text(text, @w / 2 + x_off, y + y_off, 0)
    end
end