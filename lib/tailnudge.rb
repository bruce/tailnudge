require "eventmachine"
require "eventmachine-tail"
require "terminal-notifier"
require "thor"

module Tailnudge
  autoload :VERSION,      "tailnudge/version"
  autoload :CLI,          "tailnudge/cli"
  autoload :Notification, "tailnudge/notification"
  autoload :Reader,       "tailnudge/reader"
  autoload :Result,       "tailnudge/result"

  def self.configuration=(configuration = {})
    # Patterns to match
    self.patterns = configuration[:pattern]
    # Basics
    @configuration = configuration
  end

  def self.patterns=(patterns)
    @patterns = Array(patterns).map { |pattern|
      Regexp.new(pattern, Regexp::IGNORECASE)
    }
  end
  class << self; attr_reader :patterns, :configuration; end

  def self.run(paths = [], options)
    self.configuration = options
    EventMachine.run do
      paths.each do |path|
        EventMachine.file_tail(path, Reader)
      end
    end
  end

end
