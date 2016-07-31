module Hedge
  class Location
    attr_reader :description

    def initialize( description )
      @description = description
    end

    def perform( player, command )
      if command == "look"
        puts @description
      end
    end
  end

  class Dias < Location
    def initialize
      super( "You are standing on a dias. Surrounding you are the tall trees of the forest" )
    end

    def perform( player, command )
      if command == "look at dias"
        puts "It is a raised stone dias."
      elsif command == "look at forest"
        puts "They are tall and trees."
      elsif ["enter forest", "go to forest"].include?( command )
        puts "You enter the forest."
        player.location = :forest
      else
        super( command )
      end
    end
  end

  class Forest < Location
    def initialize
      super( "You are deep in the forest." )
    end

    def perform( player, command )
      super( player, command )
    end
  end
end
