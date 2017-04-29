module Bot
  module DiscordCommands
    module Clear
      extend Discordrb::Commands::CommandContainer
      command(:clear,
              max_args: 1,
              required_permissions: [:manage_messages],
              description: 'Deletes x messages, mod only.',
              usage: "#{BOT.prefix}clear <number>") do |event, count|
            if count.nil?
                event.respond('❌ No argument specicied. Enter a valid number!')
                break
            end

            unless /\A\d+\z/ =~ count
                event.respond("`#{count}` is not a valid number!")
                break
            end
            original_num = count.to_i
            clearnum = count.to_i + 1

            begin
                while clearnum > 0
                    if clearnum >= 99
                        ids = []
                        event.channel.history(99).each { |x| ids.push(x.id) }
                        Discordrb::API::Channel.bulk_delete_messages(event.bot.token, event.channel.id, ids)
                        clearnum -= 99
                    else
                        ids = []
                        event.channel.history(clearnum).each { |x| ids.push(x.id) }
                        Discordrb::API::Channel.bulk_delete_messages(event.bot.token, event.channel.id, ids)
                        clearnum = 0
                    end
                end
                message = event.respond("🚮  Cleared #{original_num} messages!")
                sleep(3)
                message.delete
            rescue Discordrb::Errors::NoPermission
                event.respond("❌ I don't have permission to delete messages!")
                break
            end
            nil
        end
    end
  end
end
