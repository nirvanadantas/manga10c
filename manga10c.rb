require 'gosu'


class Manga10c < Gosu::Window
  def initialize 
    super(528,374,false)
    self.caption = "Manga10c"
    @imagem_fundo = Gosu::Image.new(self, "back.png", true)
    @jogador = Gosu::Image.new(self,"1.png",true)
    @pos_x = self.width / 2
    @pos_y = self.height / 2 
	@direcao = 1
  end 
  def draw
    @imagem_fundo.draw(0,0,0)
    @jogador.draw(@pos_x,230,1,@direcao)
  end 
  def update
     if ( button_down?(Gosu::Button::KbRight) ) then
	  @direcao=1
      @pos_x = @pos_x + 10 
      if (@pos_x > self.width-(@jogador.width+10) ) then 
        @pos_x = self.width-(@jogador.width+10) 
      end 
    end 
    if ( button_down?(Gosu::Button::KbLeft) ) then
	  @direcao=-1
      @pos_x = @pos_x - 10 
      if (@pos_x < 10) then @pos_x = 10 end 
    end
  end 
end