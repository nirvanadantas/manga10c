require 'gosu'
class Jogador
	def inicialize(janela)
		@janela = janela
		@imagem = Gosu::Image.new(self,"1.png",true)
		@pos_x = @janela.width / 2
    	@pos_y = @janela.height / 2
    	@direcao = 1

	end
	def draw
		@jogador.draw(@pos_x,230,1,@direcao)		
	end
	def mover_direita		
       @direcao=1
        @pos_x = @pos_x + 10 
      if (@pos_x > @janela.width-(@imagem.width+10) ) then 
        @pos_x = @janela.width-(@imagem.width+10) 
      end
	end
	def mover_esquerda		
      @direcao=-1
      @pos_x = @pos_x - 10 
      if (@pos_x < 10) then @pos_x = 10 end
	end

end