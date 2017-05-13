module Bot
  module DiscordCommands
    module Hackban
      extend Discordrb::Commands::CommandContainer
      command(:hackban,
              description: 'Ban someone that is not on the server.',
              required_permissions: [:ban_members],
              usage: "#{BOT.prefix}hackban <user_id>",
              min_args: 1) do |event, id|
            break if event.channel.private?
            if id
                begin
                  event.server.ban(id)
                rescue Discordrb::Errors::NoPermission
                  "The bot doesn't have permision to unban!"
                end
                event.respond("👌 Hack-banned user: <@#{id}>")
            else
                'Invalid argument. Please use a valid id.'
            end
        end
    end
  end
end
