module Bot
  module DiscordCommands
    module Kick
      extend Discordrb::Commands::CommandContainer
      command(:kick,
              description: 'Temporarily Kick somebody from the server.',
              required_permissions: [:kick_members],
              usage: "#{BOT.prefix}kick @User reason",
              min_args: 2) do |event, *kickreason|
            member = event.server.member(event.message.mentions[0])

            break if event.channel.private?
            if event.message.mentions[0]
                finalmessage = kickreason.drop(1)
                display = finalmessage.join(' ')
                begin
                        event.server.kick(member)
                    rescue
                        next
                end
                member.pm("You have been kicked from the server **#{event.server.name}** by #{event.message.author.mention} | **#{event.message.author.display_name}**\nThey gave the following reason: ``#{display}``")
                event.respond('👌')
            else
                'Invalid argument. Please mention a valid user.'
            end
        end
    end
  end
end
