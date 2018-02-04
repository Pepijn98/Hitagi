module Bot
  module DiscordCommands
    # Ban command
    module Ban
      extend Discordrb::Commands::CommandContainer
      command(:ban,
              description: 'Permanently ban someone from the server.',
              required_permissions: [:ban_members],
              usage: "#{BOT.prefix}ban @User reason",
              min_args: 2) do |event, *banreason|
        member = event.server.member(event.message.mentions[0])
        break if event.channel.private?
        if event.message.mentions[0]
          finalbanmessage = banreason.drop(1)
          bandisplay = finalbanmessage.join(' ')
          begin
            event.server.ban(member)
          rescue Discordrb::Errors::NoPermission
            "The bot doesn't have permision to ban!"
          end
          message = "You have been **permanently banned** from the server #{event.server.name} by #{event.message.author.mention} | **#{event.message.author.display_name}**\n"
          message << "They gave the following reason: ``#{bandisplay}``\n\n"
          message << "If you wish to appeal for your ban's removal, please contact this person, or the server owner."
          begin
            member.pm(message)
          rescue Discordrb::Errors::NoPermission
            event.respond("👌 Banned successfully, but I wasn't able to DM the user about ban reasons.")
            break
          end
          event.respond('👌 The ban hammer has hit, hard.')
        else
          'Invalid argument. Please mention a valid user.'
        end
      end
    end
  end
end
