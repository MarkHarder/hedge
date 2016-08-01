module Hedge
  class Location
    attr_reader :description

    def initialize( description )
      @description = description
    end

    def perform( player, command )
      if command == "look"
        puts @description
      elsif command == "inventory"
        puts "You are carrying:"
      elsif command =~ /^go to (.+)$/
        location = $1.to_sym
        if player.location != location && player.seen?( location )
          puts "You go to the #{location.to_s}."
          player.location = location
        end
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
      else
        super( player, command )
      end
    end
  end

  class Forest < Location
    def initialize
      super( "You are deep in the forest." )

      @unexplored = [:bell, :hut]
    end

    def perform( player, command )
      if command == "explore forest" || command == "explore"
        unless @unexplored.empty?
          player.location = @unexplored.delete( @unexplored.sample )
        end
      else
        super( player, command )
      end
    end
  end

  class Bell < Location
    def initialize
      super( "You come to a clearing with a large bell." )
    end
  end

  class Hut < Location
    def initialize
      super( "You see a small hut." )
    end
  end
end
