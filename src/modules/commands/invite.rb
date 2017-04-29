module Bot
  module DiscordCommands
    module Invite
      extend Discordrb::Commands::CommandContainer
      command(:invite,
              description: 'Sends bot invite and invite to the Support-server.',
              usage: "#{BOT.prefix}invite") do |event|
        event << "Invite link: #{BOT.invite_url}"
        event << 'Support server -> https://discord.gg/Vf4ne5b'
      end
    end
  end
end
