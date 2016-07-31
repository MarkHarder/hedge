module Hedge
  class Translator
    def initialize
      @abbreviations = {
        "q" => "quit",
        "x" => "look at",
      }

      @synonyms = {
        "trees" => "forest",
      }
    end

    def translate( text )
      for k, v in @abbreviations
        text.gsub!( /\b#{k}\b/, v )
      end

      for k, v in @synonyms
        text.gsub!( /\b#{k}\b/, v )
      end

      text
    end
  end
end
