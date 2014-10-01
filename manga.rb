require 'gosu'

class Manga
    attr_reader :x, :y
    
	def initialize(window)
        @window = window    
        @manga = Gosu::Image.new(@window, "manga4.png")
        @x = rand(@window.width)
		@y = 0
	end 
			
	def nascer_manga
		@x = rand*528                                          
        @y = rand*50       
	end
	
	def update										
		if @y > @window.height
			nascer_manga
		else
			@y = @y + 3
		end			
	end
    def draw
        @manga.draw(@x, @y, 1)				#manga aparece na tela
        #@manga.draw_rot(@x, @y, 0, 5 * Math.sin(Gosu::milliseconds / 133.7))   	#rotação da manga                        
    end
end