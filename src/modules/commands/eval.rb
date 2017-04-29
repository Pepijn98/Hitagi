module Bot
  module DiscordCommands
    module Eval
      extend Discordrb::Commands::CommandContainer
      command(:eval,
              help_available: false) do |event, *code|
        break unless event.user.id == CONFIG.owner
        begin
          eval code.join(' ')
        rescue => e
          event << "Woops an error occurred 😞 ```#{e}```"
          event << "```#{e.backtrace.join("\n")}```"
        end
      end
    end
  end
end
