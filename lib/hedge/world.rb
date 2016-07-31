require 'hedge/locations.rb'

module Hedge
  class World
    def initialize( player )
      @player = player
      @rooms = { }

      load_rooms
    end

    def current_room
      @rooms[ @player.location ]
    end

    def perform( command )
      current_room.perform( @player, command )
    end

    private
    def load_rooms
      filename = File.join( __dir__, 'locations.rb' )
      File.foreach( filename ) do |line|
        # get all the classnames
        if line =~ /^\s+class\s+(.*)\s+</
          # the classname is the paren match, stored in $1
          classname = $1

          # turn the classnames into a symbol key and an object value
          class_symbol = classname_to_symbol( classname )
          object = Hedge.const_get( classname ).new
          @rooms[ class_symbol ] = object
        end
      end
    end

    def classname_to_symbol( classname )
      # insert an underscore before all non-leading uppercase letters
      # downcase the entire string
      # LongClassName -> long_class_name
      classname.gsub(/(.)([A-Z])/, "\1_#{$2}" ).downcase.to_sym
    end
  end
end
