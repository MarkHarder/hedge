module Hedge
  class Player
    attr_accessor :location

    def initialize
      @visited = []
      @seen = [ :dias, :forest ]
      @location = :dias
      @items = []
    end

    def visited?( location )
      @visited.include?( location )
    end

    def visit( location )
      @visited.push( location ) unless visited?( location )
      see( location )
    end

    def seen?( thing )
      @seen.include?( thing )
    end

    def see( thing )
      @seen.push( thing ) unless seen?( location )
    end
  end
end
