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
      puts @world.current_room.description
      loop do
        print "> "
        command = @translator.translate( gets.chomp )

        if command == "quit"
          exit
        else
          @world.current_room.perform( command )
        end
      end
    end
  end
end
