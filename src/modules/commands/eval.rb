module Bot
  module DiscordCommands
    module Eval
      extend Discordrb::Commands::CommandContainer
      command(:eval,
              help_available: false) do |event, *code|
        break unless event.user.id == CONFIG.owner
        if event.message.content == "h.eval BOT.token"
          event.channel.send_embed do |embed|
            embed.color = 0x563055
            embed.title = "Finished evaluating:"
            embed.description = "```Ohno my token is a secret.```"
          end
        elsif event.message.content == "h.eval CONFIG.token"
          event.channel.send_embed do |embed|
            embed.color = 0x563055
            embed.title = "Finished evaluating:"
            embed.description = "```Ohno my token is a secret.```"
          end
        else
          begin
            result = eval code.join(" ")
            event.channel.send_embed do |embed|
              embed.color = 0x563055
              embed.title = "Finished evaluating:"
              embed.description = "```#{result.to_s}```"
            end
          rescue => e
            event.channel.send_embed do |embed|
              embed.color = 0xFF0000
              embed.title = "Woops an error occurred 😞"
              embed.description = "```#{e}```\n```#{e.backtrace.join("\n")[0..2048]}```"
            end
          end
        end
      end
    end
  end
end
