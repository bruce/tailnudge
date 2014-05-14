module Tailnudge

  class Notification

    def self.create(result)
      new(result).run
    end

    def initialize(result)
      @result = result
    end

    def run
      TerminalNotifier.notify(@result.message,
                              options)
    end

    private

    def options
      if Tailnudge.configuration[:all]
        Tailnudge.configuration
      else
        # Throttling by group
        Tailnudge.configuration.merge(group_id: group_id)
      end
    end

    def group_id
      [
        Process.pid,
        @result.pattern_id
      ].join('-')
    end

  end

end
