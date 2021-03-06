$LOAD_PATH << '.'

require 'gosu'
require 'jogador'
require 'manga'

class Manga10c < Gosu::Window
    def initialize 
        super(518,315,false)
        self.caption = "Manga10c"
        @imagem_fundo = Gosu::Image.new(self, "backajust.png", true)
        @jogador = Jogador.new(self)                   #classe Jogador
        @pos_x = self.width / 2
	    @direcao = 1
        @mangas = 5.times.map{Manga.new(self)}                            #cria 5 mangas
        @tempo = 0.0
        @fonte = Gosu::Font.new(self, Gosu::default_font_name, 20)
        @estado = "INICIO"
    end
    def update
        if (@estado == "INICIO" ) then
            if (button_down?(Gosu::Button::KbI)) then
                @estado = "JOGANDO"
            end
        elsif (@estado =="JOGANDO" ) then  
            if ( button_down?(Gosu::Button::KbRight) ) then
				@jogador.andar_direita
            elsif ( button_down?(Gosu::Button::KbLeft) ) then
                @jogador.andar_esquerda
            else
                @stop
            end
			@jogador.update


            for manga in @mangas do
        		manga.update
            end

        @mangas.each { |manga| manga.update}
		if @jogador.pega_mangas(@mangas) then
			@mangas << Manga.new(self)
		end
  
        @tempo += 1.0/10.0
        if (@tempo.to_i == 40) then
            @estado = "FIM" end
        elsif (@estado == "FIM") then
		
        end 
        
    end
    def draw
        @imagem_fundo.draw(0,0,0)
        if (@estado == "INICIO") then                                       #menu
            msg = "PRESSIONE [i] PARA COMECAR"                                #mensagem exibida no menu
            x=(self.width)/2-((@fonte.text_width(msg,1)/2))                   #tamanho
            @fonte.draw(msg, x, self.height/2, 3, 1.0, 1.0, 0xffff0000)       #fonte que escreve o texto
        
        elsif (@estado == "JOGANDO") then
            @jogador.draw()                                                   #mostra o jogador
            for manga in @mangas do
                manga.draw()
            end
            @fonte.draw("Placar: #{@jogador.placar}", 10, 10, 3, 1.0, 1.0, 0xffff0000)
            @fonte.draw("Tempo: #{@tempo.to_i}s", 10, 30, 3, 1.0, 1.0, 0xffff0000)
        
        elsif (@estado == "FIM") then 
			
            if (@jogador.placar < 50) then
                msg ="Voce foi pessimo, fez apenas #{"%.f" % @jogador.placar} pontos!"
            elsif (@jogador.placar > 50 and @jogador.placar < 500 )then
                msg = "Parabens voce joga bem! e fez #{"%.f" % @jogador.placar} pontos!"
            else
                msg = "Parabens voce e um ET! e fez #{"%.f" % @jogador.placar} pontos!"
            end
            x=(self.width)/2-((@fonte.text_width(msg,1)/2))
            @fonte.draw(msg, x, self.height/2, 3, 1.0, 1.0, 0xffff0000)
=begin
            msg = "FIM DE JOGO, VOCE FEZ #{@jogador.placar} pontos" 
=end
        end
    end
end







            