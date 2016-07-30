require 'hedge/locations.rb'

module Hedge
  class World
    def initialize( player )
      @player = player
      @rooms = {
        dias: Dias.new
      }
    end

    def current_room
      @rooms[ @player.location ]
    end
  end
end
