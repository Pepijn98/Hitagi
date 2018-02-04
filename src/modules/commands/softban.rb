module Bot
  module DiscordCommands
    # Softban command
    module Softban
      extend Discordrb::Commands::CommandContainer
      command(:softban,
              description: 'Softban someone from the server.',
              required_permissions: [:ban_members],
              usage: "#{BOT.prefix}softban @User reason",
              min_args: 2) do |event, *banreason|
        member = event.server.member(event.message.mentions[0])
        break if event.channel.private?
        if event.message.mentions[0]
          user_id = event.message.mentions[0].id
          finalbanmessage = banreason.drop(1)
          bandisplay = finalbanmessage.join(' ')
          begin
            event.server.ban(member)
            event.server.unban(user_id)
          rescue Discordrb::Errors::NoPermission
            "The bot doesn't have permision to ban!"
          end
          message = "You have been **soft-banned** from the server #{event.server.name} by #{event.message.author.mention} | **#{event.message.author.display_name}**\n"
          message << "They gave the following reason: ``#{bandisplay}``"
          begin
            member.pm(message)
          rescue Discordrb::Errors::NoPermission
            event.respond("👌 Successfully soft-banned, but I wasn't able to DM the user about ban reasons.")
            break
          end
          event.respond('👌 The ban hammer has hit!')
        else
          'Invalid argument. Please mention a valid user.'
        end
      end
    end
  end
end
