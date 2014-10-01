require 'gosu'
require 'manga'

class Jogador
	attr_reader :x, :y
	attr_reader :placar

	def initialize(window)
		@window = window
		@x, @y = window.width/2, 190
		@dir = :right
		@step1, @step2,=
		*Gosu::Image.load_tiles(window, "sprites.png", 100, 128, false)
		@blup = Gosu::Sample.new(@window, "blup.wav")
		@cur_image = @step1													#começa virado à direita
		@placar = 0		
		@width = 100
		@direcao=1
	end
	
	def andar_direita
        @direcao=1
        #chico anda 10px
        @x = @x + 10
        #para chico à extrema direita da tela
        if (@x > @window.width - 110) then
            @x = @window.width - 110
            #chico pára na direita
        end
	end
	
	def andar_esquerda
	    @direcao=-1
        @x = @x - 10
        if (@x < 110) then
            @x = 110
		end        
	end

	def update
		if 
			#da passinhos
			@cur_image = (Gosu::milliseconds / 175 % 2 == 0) ? @step1 : @step2
		else
			@stop
		end
	end

	def draw()
		@cur_image.draw(@x,@y,1,@direcao)
		
	end
	
	def pega_mangas(mangas)
		mangas.reject!  do |manga| 
			if (Gosu::distance(@x, @y, manga.x, manga.y) < 45) then 
			  @blup.play
			  @placar+=10
			  true
			else
			  false
			end
    	end
	end
end