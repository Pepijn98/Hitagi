module Bot
  module DiscordCommands
    # Unban command
    module Unban
      extend Discordrb::Commands::CommandContainer
      command(:unban,
              description: 'Unban someone that was previously banned on this server.',
              required_permissions: [:ban_members],
              usage: "#{BOT.prefix}unban <user_id>",
              min_args: 1) do |event, id|
        break if event.channel.private?
        if id
          begin
            event.server.unban(id)
          rescue Discordrb::Errors::NoPermission
            "The bot doesn't have permision to unban!"
          end
          event.respond("👌 Unbanned user: <@#{id}>")
        else
          'Invalid argument. Please use a valid id.'
        end
      end
    end
  end
end
