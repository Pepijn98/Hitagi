module Bot
  module DiscordCommands
    # Invite command
    module Invite
      extend Discordrb::Commands::CommandContainer
      command(:invite,
              description: 'Sends bot invite and invite to the Support-server.',
              usage: "#{BOT.prefix}invite") do |event|
        event << "Invite link: #{BOT.invite_url}"
        event << 'Support server -> https://discord.gg/Vf4ne5b'
        event << "Hitagi's website -> https://hitagi.kurozero.xyz"
      end
    end
  end
end
