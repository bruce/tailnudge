module Tailnudge

  class Result

    def initialize(match, text)
      @match = match
      @text  = text
    end

    def message
      @match[1] || @text
    end

    def pattern_id
      @match.regexp.object_id
    end

  end

end
