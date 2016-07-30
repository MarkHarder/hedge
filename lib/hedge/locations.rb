module Hedge
  class Location
    attr_reader :description

    def initialize( description )
      @description = description
    end

    def perform( command )
      if command == "look"
        puts @description
      end
    end
  end

  class Dias < Location
    def initialize
      super( "You are standing on a dias." )
    end

    def perform( command )
      if command == "look at dias"
        puts "It is a raised stone dias."
      else
        super( command )
      end
    end
  end
end
