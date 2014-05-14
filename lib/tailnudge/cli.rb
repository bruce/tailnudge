module Tailnudge

  class CLI < Thor

    method_option :all, {
      aliases: %w(-a),
      default: false,
      desc:    "Notify on every match (no throttling by pattern)"
    }
    method_option :title, {
      aliases: %w(-t),
      default: "tailnudge",
      desc:    "Title to use for notifications"
    }
    method_option :subtitle, desc: "Subtitle to use for notifications"
    method_option :sound, {
      lazy_default: 'default',
      aliases: %w(-s),
      desc: "Sound to play (listed in Sound Preferences, note they are case-sensitive)"
    }
    method_option :pattern, {
      aliases: %w(-p --patterns),
      type: :array,
      required: true,
      desc: "Regular expressions to match. Case-insensitive. Note that if a capture is present, only its contents will be used in the notification."
    }
    desc "tail FILE [MORE_FILES]", "Tail files for patterns"
    def tail(files = [])
      Tailnudge.run(Array(files), options)
    end

    default_task :tail

  end

end
