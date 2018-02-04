module Bot
  module DiscordCommands
    # Roles command
    module Roles
      extend Discordrb::Commands::CommandContainer
      command(:roles,
              description: 'Get the guild roles.',
              usage: "#{BOT.prefix}roles") do |event|
        server = event.message.channel.server
        roles = server.roles.map(&:name)
        roles *= ', '
        event.channel.send_embed do |embed|
          embed.colour = 0x563055
          embed.description = roles.to_s
          embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: 'All guild roles:')
        end
      end
    end
  end
end
