require 'gosu'

class Jogador
  attr_reader :x, :y

  def initialize(window, x, y)
    @x, @y = x, y
    @dir = :right
	@dir1, @dir2, @esq1, @esq2 =
		*Gosu::Image.load_tiles(window, "img.png", 135, 141, false)
	@cur_image = @dir1			#começa virado à direita
	@placar = 0
  end
	def update
		if (move_x > 0) then
			@dir = :right
			move_x.times do @x += 1 end 
		end
 
		if (move_x < 0) then
			@dir = :left
			(-move_x).times do @x -= 1 end 
         end
    end
	def draw
		@cur_image.draw(@x, @y-134, 0, factor, 1.0)
	end
end