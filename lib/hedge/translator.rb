module Hedge
  class Translator
    def initialize
      @abbreviations = {
        "q" => "quit",
        "x" => "look at",
      }
    end

    def translate( text )
      for k, v in @abbreviations
        text.gsub!( /\b#{k}\b/, v )
      end

      text
    end
  end
end
