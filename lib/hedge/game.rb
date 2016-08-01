require 'hedge/player'
require 'hedge/translator'
require 'hedge/world'

module Hedge
  class Game
    def initialize
      @player = Player.new
      @world = World.new( @player )
      @translator = Translator.new
    end

    def run
      loop do
        unless @player.visited?( @player.location )
          puts @world.current_room.description
          @player.visit( @player.location )
        end

        print "> "
        command = @translator.translate( gets.chomp )

        if command == "quit"
          exit
        else
          @world.perform( command )
        end
      end
    end
  end
end
