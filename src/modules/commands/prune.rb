module Bot
  module DiscordCommands
    module Prune
      extend Discordrb::Commands::CommandContainer
      command(:prune,
              description: 'Prune the messages from the bot.',
              usage: "#{BOT.prefix}prune <number>",
              required_permissions: [:manage_messages],
              max_args: 1) do |event, num|
                begin
                    num = 50 if num.nil?
                    count = 0
                    event.channel.history(num).each do |x|
                      if x.author.id == event.bot.profile.id
                        x.delete
                        count += 1
                      end
                    end
                    message = event.respond("✅ Pruned #{count} messages!")
                    sleep(10)
                    message.delete
                    event.message.delete
                rescue Discordrb::Errors::NoPermission
                    event.channel.send_message("❌ I don't have permission to delete messages!")
                    puts 'The bot does not have the delete message permission!'
                end
              end
    end
  end
end
