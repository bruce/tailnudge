module Tailnudge

  class Reader < EventMachine::FileTail

    def self.extract(line)
      Tailnudge.patterns.each do |pattern|
        match = pattern.match(line)
        if match
          return Result.new(match, line)
        end
      end
      nil
    end

    def initialize(path, startpos=-1)
      super(path, startpos)
      @buffer = BufferedTokenizer.new
    end

    def receive_data(data)
      @buffer.extract(data).each do |line|
        result = self.class.extract(line)
        if result
          Notification.create(result)
        end
      end
    end

  end

end
